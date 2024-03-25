//
//  MainPageModel.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import Foundation

struct MainPageModel: Decodable {
    var name: String
    var description: String
    var link: String
    var iconURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case link
        case iconURL = "icon_url"
    }
}
