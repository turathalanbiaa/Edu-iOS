//
//  User.swift
//  e-learning
//
//  Created by hussein abed on 2/10/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String?
    let type: UserType?
    let lang: Language?
    let email: String?
    let phone: String?
    let password: String?
    let Gender: Gender?
    let country: String?
    let birthdate: Date?
    let address: String?
    let createdAt: Date?
    let lastLogin: Date?
    let state: Int?
    let rememberToken: String?
}

struct UserIds: Codable {
    let userID: Int?
    let image: [URL]?
    let state: IdsState?
}

struct Country: Codable, Identifiable {
    let id = UUID()
    let key: String
    let value: String
}

struct Certificate: Codable, Identifiable {
    let id = UUID ()
    let key: String
    let value: String
}

enum IdsState: Int, Codable {
    case waiting = 1
    case approved = 2
    case rejected = 3
}

enum UserType: Int, Codable {
    case student = 1
    case listeener = 2
    
}

enum Language: String, Codable {
    case arabic = "ar"
    case english = "en"
}

enum Gender: Int, Codable {
    case male
    case female
}

