//
//  Root.swift
//  e-learning
//
//  Created by hussein abed on 2/10/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
struct Root <T: Codable>: Codable {
    let data: T?
    let error: String?
    let state: Bool?
}
