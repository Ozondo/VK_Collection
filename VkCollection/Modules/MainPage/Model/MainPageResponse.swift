//
//  MainPageResponse.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import Foundation

struct MainPageResponse: Decodable {
    let body: MainPageBody
    let status: Int
}

struct MainPageBody: Decodable {
    let services: [MainPageServiceModel]
}
