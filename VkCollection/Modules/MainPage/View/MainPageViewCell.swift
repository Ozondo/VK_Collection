//
//  MainPageViewCell.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit


final class MainPageViewCell: UICollectionViewCell {
    
    // MARK: - private properties
    private enum Const {
        static let heightImage: CGFloat = 50
        static let widthImage: CGFloat = 50
        static let leadingOrTrailingConst: CGFloat = 10
        static let topOrBottomConst: CGFloat = 10
    }
    
    private let name: UILabel = {
        let name = UILabel()
        name.text = "Вконтакте"
        name.font = UIFont.systemFont(ofSize: 14)
        name.textColor = .white
        return name
    }()
    
    private let descriptionOfService: UILabel = {
        let description = UILabel()
        description.text = "1321"
        description.textColor = .white
        description.font = UIFont.systemFont(ofSize: 10)
        return description
    }()
    
    private let icon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "display")
        return image
    }()
    
    private let char: UILabel = {
        let description = UILabel()
        description.text = ">"
        description.textColor = .white
        return description
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        viewSetup()
        layoutObjects()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private properties
    private func viewSetup() {
        [name,
         icon,
         descriptionOfService,
         char
        ].forEach { element in
            contentView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func layoutObjects() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingOrTrailingConst),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topOrBottomConst),
            icon.widthAnchor.constraint(equalToConstant: Const.widthImage),
            icon.heightAnchor.constraint(equalToConstant: Const.heightImage),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topOrBottomConst),
            name.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Const.leadingOrTrailingConst),
            
            descriptionOfService.topAnchor.constraint(equalTo: name.bottomAnchor, constant: Const.topOrBottomConst),
            descriptionOfService.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Const.leadingOrTrailingConst),
            
            char.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            char.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
}

extension MainPageViewCell {
    func setServiciesForCell(info: MainPageModel) {
        name.text = info.name
        descriptionOfService.text = info.description
    }
}
