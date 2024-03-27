//
//  ViewController.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit

final class MainPageViewController: UIViewController, MainPageInput {
    // MARK: - private properties
    private let mainPageView = MainPageView()
    private let presenter: MainPageOutput
    
    // MARK: - init
    init(presenter: MainPageOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        presenter.viewDidLoad()
    }

    // MARK: - MainPageInput
    func setServices(services: [MainPageServiceModel]) {
        mainPageView.setServices(info: services)
    }

    // MARK: - private
    private func setUp() {
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        
        mainPageView.cellDidTapped = { [weak self] index in
            self?.presenter.routeToService(index: index)
        }
    }
}
