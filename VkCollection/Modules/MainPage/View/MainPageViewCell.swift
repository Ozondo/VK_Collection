//
//  MainPageViewCell.swift
//  VkCollection
//
//  Created by Егор Иванов on 25.03.2024.
//

import UIKit
import Kingfisher


final class MainPageViewCell: UICollectionViewCell {
    
    // MARK: - private properties
    private enum Const {
        static let heightImage: CGFloat = 70
        static let widthImage: CGFloat = 70
        static let leadingOrTrailingConst: CGFloat = 10
        static let topOrBottomConst: CGFloat = 10
    }
    
    private let name: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 18)
        name.textColor = .white
        return name
    }()
    
    private let descriptionOfService: UILabel = {
        let description = UILabel()
        description.textColor = .white
        description.font = UIFont.systemFont(ofSize: 12)
        description.textAlignment = .left
        description.numberOfLines = 0
        return description
    }()
    
    private let icon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
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
         //char
        ].forEach { element in
            contentView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func layoutObjects() {
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topOrBottomConst),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingOrTrailingConst),
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.topOrBottomConst),
            icon.widthAnchor.constraint(equalToConstant: Const.widthImage),
            icon.heightAnchor.constraint(equalToConstant: Const.heightImage),
            
            
            descriptionOfService.topAnchor.constraint(equalTo: icon.centerYAnchor),
            descriptionOfService.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Const.leadingOrTrailingConst),
            descriptionOfService.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.topOrBottomConst),
            descriptionOfService.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.topOrBottomConst),
            name.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Const.leadingOrTrailingConst),
            name.bottomAnchor.constraint(equalTo: icon.centerYAnchor)
        ])
    }
}

extension MainPageViewCell {
    func setServiciesForCell(info: Service) {
        name.text = info.name
        descriptionOfService.text = info.description
        icon.kf.setImage(with: URL(string: info.iconURL))
    }
}
