//
//  MainPageView.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit

final class MainPageView: UIView {
    var services: [MainPageServiceModel] = []
    var cellDidTapped: ((Int) -> Void)?
    
    // MARK: - private properties
    private let collectionOfServices: UICollectionView = {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(50)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        collectionOfServices.register(
            MainPageViewCell.self,
            forCellWithReuseIdentifier: MainPageViewCell.identifier
        )
    }
    
    // MARK: - private methods
    private func viewSetup(){
        addSubview(collectionOfServices)
        collectionOfServices.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        collectionOfServices.backgroundColor = .black
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
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainPageViewCell.identifier,
            for: indexPath
        ) as? MainPageViewCell else { return MainPageViewCell()  }
        let itemsForCell = services[indexPath.item]
        
        cell.setInfo(itemsForCell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellDidTapped?(indexPath.item)
    }
}

extension MainPageView {
    func setServices(info: [MainPageServiceModel]) {
        self.services = info
        
        collectionOfServices.reloadData()
    }
}
