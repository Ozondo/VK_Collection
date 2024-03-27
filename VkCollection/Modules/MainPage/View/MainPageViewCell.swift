import UIKit
import Kingfisher

final class MainPageViewCell: UICollectionViewCell {
    
    static let identifier = "MainPageViewCell"
    
    // MARK: - private properties
    private enum Const {
        static let heightImage: CGFloat = 60
        static let widthImage: CGFloat = 60
        static let sideOffset: CGFloat = 10
        static let sideOffsetImage: CGFloat = -20
        static let sideOffsetLabelsToImage: CGFloat = -30
    }
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let description = UILabel()
        description.textColor = .white
        description.font = UIFont.systemFont(ofSize: 12)
        description.textAlignment = .left
        description.numberOfLines = 0
        return description
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        viewSetup()
        layoutObjects()
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private properties
    private func viewSetup() {
        [nameLabel,
         iconImageView,
         descriptionLabel,
         imageView
        ].forEach { element in
            contentView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func layoutObjects() {
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.sideOffset),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.sideOffset),
            iconImageView.widthAnchor.constraint(equalToConstant: Const.widthImage),
            iconImageView.heightAnchor.constraint(equalToConstant: Const.heightImage),
            iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Const.sideOffset),
            
            descriptionLabel.topAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Const.sideOffset),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Const.sideOffset),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: Const.sideOffsetLabelsToImage),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.sideOffset),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Const.sideOffset),
            nameLabel.bottomAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: Const.sideOffsetLabelsToImage),
            
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.sideOffsetImage),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension MainPageViewCell {
    func setInfo(_ info: MainPageServiceModel) {
        nameLabel.text = info.name
        descriptionLabel.text = info.description
        iconImageView.kf.setImage(with: URL(string: info.iconURL))
    }
}
