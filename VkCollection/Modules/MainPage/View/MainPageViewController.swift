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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleSetup()
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        view = mainPageView
    }
    private func titleSetup() {
        let titleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    func setServicies(servicies: [Service]) {
        mainPageView.setServicies(info: servicies)
    }
}

