//
//  Announcement.swift
//  e-learning
//
//  Created by hussein abed on 2/10/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct Announcement: Codable {
    let id: Int
    let language: Language?
    let title: String
    let content: String?
    let image: URL?
    let url: URL?
    let youtubeVideoID: String?
    let type: AnnouncemenType?
    let state: AnnouncementState?
}


enum AnnouncemenType: Int, Codable {
    case student = 1
    case listener = 2
    case all     = 3
}

enum AnnouncementState: Int, Codable {
    case active = 1
    case notActive = 2
}
