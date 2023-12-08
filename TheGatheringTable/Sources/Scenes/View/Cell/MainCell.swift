import UIKit
import SnapKit

class MainCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    var cardElement: CardElement? {
        didSet {
            nameLabel.text = cardElement?.name
            typeLabel.text = cardElement?.type
            
            guard let imagePath = cardElement?.imageURL,
                  let imageURL = URL(string: imagePath) else {
                cardImageView.image = UIImage(named: "square-image")
                return
            }
            ImageLoader.shared.loadImage(from: imageURL, into: cardImageView)
        }
    }

    // MARK: - UI
    
    private lazy var cardImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(typeLabel)
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(cardImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(40)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.leading.equalTo(cardImageView.snp.trailing).offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(50)
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.cardElement = nil
    }
}
