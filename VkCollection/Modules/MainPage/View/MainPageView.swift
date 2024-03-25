//
//  MainPageView.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit


final class MainPageView: UIView {
    
    var servicies: [MainPageModel] = []
    
    // MARK: - private properties
    private let collectionOfServices: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        collectionSetup()
        viewSetup()
        layoutElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func collectionSetup() {
        collectionOfServices.dataSource = self
        collectionOfServices.delegate = self
        collectionOfServices.register(MainPageViewCell.self, forCellWithReuseIdentifier: "id")
    }
    
    // MARK: - private methods
    private func viewSetup(){
        [collectionOfServices
        ].forEach { element in
            addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    private func layoutElements() {
        NSLayoutConstraint.activate([
            collectionOfServices.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionOfServices.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionOfServices.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionOfServices.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

    // MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension MainPageView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as? MainPageViewCell else { return MainPageViewCell()  }
        let itemsForCell = servicies[indexPath.item]
        cell.setServiciesForCell(info: itemsForCell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: bounds.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension MainPageView {
    func setServicies(info: [MainPageModel]) {
        self.servicies = info
        
        collectionOfServices.reloadData()
    }
}
