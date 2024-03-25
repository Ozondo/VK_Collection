//
//  MainPageIO.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit


protocol MainPageInput: AnyObject {
    var title: String? { get set }
    func setServicies(servicies: [Service])
}

protocol MainPageOutput: AnyObject {
    func viewDidLoad()
}
