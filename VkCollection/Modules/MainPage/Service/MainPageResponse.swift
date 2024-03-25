//
//  MainPageResponse.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit

struct MainPageResponse: Codable {
    let body: Body
    let status: Int
}
struct Body: Codable {
    let services: [Service]
}
