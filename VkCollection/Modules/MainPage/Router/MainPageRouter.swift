//
//  MainPageRouter.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit

protocol MainPageRouter {
    func openLink(_ link: URL)
}

final class MainPageRouterImpl: MainPageRouter {
    
    weak var sceneController: UIViewController?
    
    func openLink(_ link: URL) {
        UIApplication.shared.open(link)
    }
}
