//
//  MainPageBuilder.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit


final class MainPageBuilder {
    static func build() -> UIViewController {
        let service = MainPageServiceImpl()
        let presenter = MainPagePresenter(service: service)
        let view = MainPageViewController(presenter: presenter)
        
        presenter.view = view
        
        return view 
    }
}
