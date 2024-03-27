//
//  MainPageModel.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import Foundation

struct MainPageServiceModel: Decodable {
    let link: URL
    let name: String
    let iconURL: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case name, description, link
        case iconURL = "icon_url"
    }
}
