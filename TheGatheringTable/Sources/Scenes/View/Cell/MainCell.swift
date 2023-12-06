import UIKit
import SnapKit

class MainCell: UITableViewCell {
    
    static let identifier = "MainCell"

    // MARK: - UI
    
    private lazy var cardImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
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
    }
    
    // MARK: - Reuse
    
}
