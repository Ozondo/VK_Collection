//
//  MainPageIO.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import Foundation

protocol MainPageInput: AnyObject {
    var title: String? { get set }
    func setServices(services: [MainPageServiceModel])
}

protocol MainPageOutput: AnyObject {
    func viewDidLoad()
    func routeToService(index: Int)
}

