import UIKit
import SnapKit

class DetailedView: UIView {
    
    var cardElement: CardElement? {
        didSet {
            nameLabel.text = cardElement?.name
            typeLabel.text = cardElement?.type
            rarityLabel.text = cardElement?.rarity
            textLabel.text = cardElement?.text
            
            guard let imagePath = cardElement?.imageURL,
                  let imageURL = URL(string: imagePath) else {
                cardImageView.image = UIImage(named: "square-image")
                return
            }
            ImageLoader.shared.loadImage(from: imageURL, into: cardImageView)
        }
    }

    // MARK: - UI
    
    lazy var cardImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        return label
    }()
    
    lazy var typeLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    lazy var rarityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(rarityLabel)
        addSubview(textLabel)
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.width.equalTo(300)
            make.height.equalTo(400)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cardImageView.snp.bottom).offset(40)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        rarityLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(typeLabel.snp.bottom).offset(10)
        }
        
        textLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rarityLabel.snp.bottom).offset(10)
            make.width.equalTo(370)
        }
    }
}
