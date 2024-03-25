//
//  MainPageModel.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import Foundation

struct Service: Codable {
    let name, description: String
    let link: String
    let iconURL: String

    enum CodingKeys: String, CodingKey {
        case name, description, link
        case iconURL = "icon_url"
    }
}
