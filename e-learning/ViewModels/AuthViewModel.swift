//
//  AuthViewModel.swift
//  e-learning
//
//  Created by hussein abed on 2/9/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var countries: [Country]?
    @Published var certificates: [Certificate]?
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var confirmedPassword = ""
    @Published var address = ""
    @Published var type = 1
    @Published var selectedCertificate = 0
    @Published var selectedGender = 0
    @Published var selectedLanguage = 0
    @Published var selectedCountry: Int = 7
    @Published var birthDate = Date()
    @Published var isLoadingCountries = true
    @Published var isLoadingcertificate = true
    @Published var isValid = false
    
    @Published var nameMessage = ""
    @Published var emailMessage = ""
    @Published var phoneMessage = ""
    @Published var addressMessage = ""
    @Published var passwordMessage = ""
    @Published var confirmedPasswordMessage = ""
    @Published var certificateMessage = ""
    @Published var countriesMessage = ""
    
    enum FieldCheck {
      case valid
      case notValid
      case notFull
      case empty
      case noMatch
      case notStrongEnough
    }
    
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var isNameEmptyPublsher: AnyPublisher<Bool, Never> {
        $name.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { name in
                return name == ""
            }
            .eraseToAnyPublisher()
    }
    
    private var isNameValidlPublisher: AnyPublisher<Bool, Never> {
        $name.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { name in
                return name.count > 4
            }
            .eraseToAnyPublisher()
    }
    
    private var isEmailEmptyPublisher: AnyPublisher<Bool, Never> {
        $email.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { email in
                return email == ""
            }
            .eraseToAnyPublisher()
    }

    private var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $email.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { email in
                return !email.isValidEmail()
            }
            .eraseToAnyPublisher()
    }
    
    
    private var isPhoneEmptyPublisher: AnyPublisher<Bool, Never> {
        $phone.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phone in
                return phone == ""
            }
            .eraseToAnyPublisher()
    }
    
    private var isPhoneValidPublisher: AnyPublisher<Bool, Never> {
        $phone.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { phone in
                return phone.count > 6
            }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
        $password.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in
                return password == ""
            }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $password.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in
                return password.count > 9
            }
            .eraseToAnyPublisher()
    }
    
    private var arePasswordsEqualPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $confirmedPassword).debounce(for: 0.8, scheduler: RunLoop.main)
            .map { password, confirmedPassword in
                return password == confirmedPassword
            }
            .eraseToAnyPublisher()
    }
    
    private var isAddressEmptyPublisher: AnyPublisher<Bool, Never> {
        $address.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { address in
                return address == ""
            }
            .eraseToAnyPublisher()
    }
    
    private var isAddreesValidPublisher: AnyPublisher<Bool, Never> {
        $address.debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { address in
                return address.count > 12
            }
            .eraseToAnyPublisher()
    }
    
    private var isCertificateEmptyPublisher: AnyPublisher<Bool, Never> {
        $certificates.debounce(for: 0.8, scheduler: RunLoop.main)
            .map { certificates in
                return certificates == nil
            }
            .eraseToAnyPublisher()
    }
    
    private var isCountriesEmptyPublisher: AnyPublisher<Bool, Never> {
        $countries.debounce(for: 0.8, scheduler: RunLoop.main)
            .map { countries in
                return countries == nil
            }
            .eraseToAnyPublisher()
    }
    
    private var isFormValidFirstPartPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(isNameEmptyPublsher, isNameValidlPublisher, isEmailEmptyPublisher, isEmailValidPublisher)
            .map { nameIsEmpty, nameIsValid, emailIsEmpty, emailIsValid in
                return !nameIsEmpty || nameIsValid || !emailIsEmpty || emailIsValid
            }
            .eraseToAnyPublisher()
    }
    
   private var isFormValidSecondPartPublisher: AnyPublisher<Bool, Never> {
          Publishers.CombineLatest4(isPhoneEmptyPublisher, isPhoneValidPublisher, isAddressEmptyPublisher, isAddreesValidPublisher)
              .map { phoneIsEmpty, phoneIsValid, addressIsEmpty, addressIsValid in
                  return !phoneIsEmpty || phoneIsValid || !addressIsEmpty || addressIsValid
              }
             .eraseToAnyPublisher()
          }
    
    init() {
        
        Publishers.CombineLatest(isNameEmptyPublsher, isNameValidlPublisher)
            .map { nameIsEmpty, nameIsValid in
                if (nameIsEmpty) {
                    return "This field is required"
                }
                else if (!nameIsValid) {
                    return "Please write the first and last name"
                }
                else {
                    return ""
                }
            }
            .assign(to: \.nameMessage, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest(isAddressEmptyPublisher, isAddreesValidPublisher)
            .map { addressIsEmpty, addressIsValid in
                if (addressIsEmpty) {
                    return "This field is required"
                }
                else if (!addressIsValid) {
                    return "Please write the first and last name"
                }
                else {
                    return ""
                }
            }
            .receive(on: RunLoop.main)
            .assign(to: \.addressMessage, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest(isPhoneEmptyPublisher, isPhoneValidPublisher)
            .map { phonelIsEmpty, phoneIsValid in
                if (phonelIsEmpty) {
                    return "This field is required"
                }
                else if (!phoneIsValid) {
                    return "Please write the first and last name"
                }
                else {
                    return ""
                }
            }
            .receive(on: RunLoop.main)
            .assign(to: \.phoneMessage, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest(isEmailEmptyPublisher, isEmailValidPublisher)
            .map { emailIsEmpty, emailIsValid in
                if (emailIsEmpty) {
                    return "This field is required"
                }
                else if (!emailIsValid) {
                    return "Please write the first and last name"
                }
                else {
                    return ""
                }
            }
            .receive(on: RunLoop.main)
            .assign(to: \.emailMessage, on: self)
            .store(in: &cancellableSet)
        
        isCertificateEmptyPublisher.map { certificates in
                return certificates ? "Please select cerifificate" : ""
            }
            .receive(on: RunLoop.main)
            .assign(to: \.certificateMessage, on: self)
            .store(in: &cancellableSet)
        
        isCountriesEmptyPublisher.map { countries in
                return countries ? "Please select cerifificate" : ""
            }
            .receive(on: RunLoop.main)
            .assign(to: \.countriesMessage, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest(isFormValidFirstPartPublisher, isFormValidSecondPartPublisher)
            .map { formIsValidFirst, formIsValidSecond in
                return formIsValidFirst || formIsValidSecond
                }
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
        
    }
    
    func login (userName: String, password: String) {
        APIHandler.login(email: userName, password: password) { result in
            switch result {
            case .success(let response):
                if let user = response.data {
                    Defaults.shared.saveObject(object: user, forKey: "user")
                    self.user = user
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func isLogged() {
        Defaults.shared.getObject(object: user, forKey: "user") { (user) in
            if let user = user {
                self.user  = user
            }
        }
    }
    
    func fetchCountries(language: String) {
        APIHandler.countries(language: language) { (result) in
            switch result {
            case .success(let response):
                self.isLoadingCountries = false
                if let countries = response.data {
                    self.countries = countries
                }
            case .failure(let error):
                self.isLoadingCountries = false
                print(error)
            }
        }
    }
    
    func fetchCertificates(language: String) {
        APIHandler.certificates(language: language) { (result) in
            switch result {
            case .success(let response):
                self.isLoadingcertificate = false
                if let certificates = response.data {
                    self.certificates = certificates
                }
            case .failure(let error):
                self.isLoadingcertificate = false
                print(error)
            }
        }
    }
    
    
}


