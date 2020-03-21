//
//  SignUpView.swift
//  e-learning
//
//  Created by hussein abed on 1/29/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct SignUpModalView: View{
    
    @State private var presentedDatePicker = false
    @State private var presentedCertificatesPicker = false
    @State private var presentedCountries = false
    @State private var formOffset: CGFloat = 0
    
    func moveUp(flag: Bool) -> CGFloat {flag ? -150: 0}
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    var gender =  [["key": Gender.male, "value": "Male"],["key": Gender.female, "value": "Female"]]
    var language = [["key": Language.arabic, "value": "Arabic"],["key": Language.english, "value": "English"]]
    
    @ObservedObject var auth = AuthViewModel ()
    
    private var countriesPicker: some View {
        BottomSheetView(isOpen: $presentedCountries, maxHeight: 410) {
            if auth.isLoadingCountries {
                ActivityIndicator(style: .large)
            }
            else {
                Picker(selection: $auth.selectedCountry, label: Text("")) {
                    ForEach(0 ..< (auth.countries?.count ?? 0)) { index in
                        Text(self.auth.countries?[index].value ?? "").tag(index)
                            .foregroundColor(Color.black)
                    }
                }.frame(width: UIScreen.main.bounds.width - 60).clipped()
                
                PrimaryButtonView(text: "Continue") {
                    self.presentedCountries = false
                }.padding(.bottom, 20).padding([.trailing, .leading])
            }
            
        }
    }
    
    private var certificatePicker: some View {
        BottomSheetView(isOpen: self.$presentedCertificatesPicker, maxHeight: 410) {
            if self.auth.isLoadingcertificate {
                ActivityIndicator(style: .large)
            }
            else {
                Picker(selection: $auth.selectedCertificate, label: Text("")) {
                    ForEach(0 ..< (auth.certificates?.count ?? 0)) { index in
                        Text(self.auth.certificates?[index].value ?? "").tag(index)
                            .foregroundColor(Color.black)
                    }
                }.frame(width: UIScreen.main.bounds.width - 60).clipped()
                
                PrimaryButtonView(text: "Continue") {
                    self.presentedCertificatesPicker = false
                }.padding(.bottom, 20).padding([.trailing, .leading])
            }
            
        }.highPriorityGesture(DragGesture())
    }
    private var birthDatePicker: some View {
        BottomSheetView(isOpen: self.$presentedDatePicker, maxHeight: 410) {
            DatePicker(selection: $auth.birthDate, in: ...Date(), displayedComponents: .date){
                Text("")
            }
            PrimaryButtonView(text: "Continue") {
                self.presentedDatePicker = false
            }.padding(.bottom, 20).padding([.trailing, .leading])
            
        }.highPriorityGesture(DragGesture())
    }
    
    var body: some View {
        Group {
            ScrollView {
                VStack(spacing: 40) {
                    Image("Logo")
                    
                    Text("Sign Up")
                        .font(.title)
                        .bold()
                    
                    VStack {
                        Group {
                            VStack(alignment: .leading) {
                                PrimaryTextFieldView(value: $auth.name, placeholder: "Name", onEditingChanged: { flag in
                                    withAnimation {
                                        self.formOffset = self.moveUp(flag: flag)
                                    }
                                })
                                Text(auth.nameMessage)
                                    .padding(.leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.red)
                            }
                            
                            VStack(alignment: .leading) {
                               PrimaryTextFieldView(value: $auth.email, placeholder: "Email", icon: Image(systemName: "at"), onEditingChanged: { flag in
                                   withAnimation {
                                       self.formOffset = self.moveUp(flag: flag)
                                   }
                               })
                               Text(auth.emailMessage)
                                    .padding(.leading)
                                   .font(.system(size: 10))
                                   .foregroundColor(.red)
                            }
                            
                            VStack(alignment: .leading) {
                                PrimaryTextFieldView(value: $auth.phone, placeholder: "Phone", icon: Image(systemName: "at"), onEditingChanged: { flag in
                                    withAnimation {
                                        self.formOffset = self.moveUp(flag: flag)
                                    }
                                }).keyboardType(.numberPad)
                                Text(auth.phoneMessage)
                                    .padding(.leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.red)
                            }
                            
                            VStack(alignment: .leading) {
                               PrimaryTextFieldView(value: $auth.address, placeholder: "Adrees", icon: Image(systemName: "at"), onEditingChanged: { flag in
                                   withAnimation {
                                       self.formOffset = self.moveUp(flag: flag)
                                   }
                               })
                               Text(auth.addressMessage)
                                    .padding(.leading)
                                   .font(.system(size: 10))
                                   .foregroundColor(.red)
                            }
                            
                            VStack(alignment: .leading) {
                                PrimaryTextFieldView(value: $auth.password, placeholder: "Password", icon:
                                    Image(systemName: "lock"), isSecure: true, onEditingChanged: { _ in
                                        withAnimation {
                                            self.formOffset = self.moveUp(flag: false)
                                        }
                                })
                            }
                            
                            VStack(alignment: .leading) {
                                Text(auth.passwordMessage)
                                    .padding(.leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.red)
                                
                                PrimaryTextFieldView(value: $auth.confirmedPassword, placeholder: "Confirm Password", icon: Image(systemName: "lock.rotation"), isSecure: true )
                                Text(auth.confirmedPasswordMessage)
                                    .padding(.leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.red)
                            }
                            
                        }
                        
                        Group {
                            PickerDateField(value: $auth.birthDate, icon: Image(systemName: "calendar.circle"), label: "Birth Date").onTapGesture {
                                self.presentedDatePicker.toggle()
                                self.presentedCountries = false
                                self.presentedCertificatesPicker = false
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                            }
                            
                            VStack (alignment: .leading) {
                                PickerTextField(value: auth.certificates?[auth.selectedCertificate].value ?? "", label: "Certificate")
                                    .onTapGesture {
                                        self.presentedDatePicker = false
                                        self.presentedCountries = false
                                        self.presentedCertificatesPicker.toggle()
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                                        
                                }
                                Text(auth.certificateMessage)
                                    .padding(.leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.red)
                            }
                            
                            VStack (alignment: .leading) {
                                PickerTextField(value: auth.countries?[auth.selectedCountry].value ?? "", label: "Country")
                                    .onTapGesture {
                                        self.presentedDatePicker = false
                                        self.presentedCountries.toggle()
                                        self.presentedCertificatesPicker = false
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                                }
                                Text(auth.countriesMessage)
                                    .padding(.leading)
                                    .font(.system(size: 10))
                                    .foregroundColor(.red)
                                
                            }
                            
                
                            HStack {
                                Text("Gender")
                                Picker(selection: $auth.selectedGender, label: Text("")) {
                                    ForEach(0 ..< gender.count) { index in
                                        Text("\(self.gender[index]["value"] as! String)")
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                            }.padding(.bottom)
                            
                            HStack {
                                Text("Language")
                                Picker(selection: $auth.selectedLanguage, label: Text("")) {
                                    ForEach(0 ..< language.count) { index in
                                        Text("\(self.language[index]["value"] as! String)")
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                            }.padding(.bottom, 60)
                        }
                        
                        PrimaryButtonView(text: "Sign up") {}
                    }
                    
                    Button(action: {}) {
                        HStack {
                            Text("Already have an account?").accentColor(Color.accentColor)
                        }
                    }
                    
                }.padding().offset(y: self.formOffset)
                
            }
            self.birthDatePicker
            self.countriesPicker
            self.certificatePicker
        }.onAppear(){
            self.auth.fetchCountries(language: "en")
            self.auth.fetchCertificates(language: "en")
        }
        
    }
}

struct SignUpView: View {
    var body: some View {
        ZStack(alignment: .bottom){
            SignUpModalView().environmentObject(AuthViewModel())
            AnyView(EmptyView().foregroundColor(Color.gray))
            
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
