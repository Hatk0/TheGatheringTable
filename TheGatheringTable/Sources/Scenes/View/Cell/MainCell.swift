import UIKit
import SnapKit

class MainCell: UITableViewCell {
    
    static let identifier = "MainCell"

    // MARK: - UI
    
    private lazy var cardImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
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
        cardImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(150)
        }
    }
    
    private func setupLayout() {
        
    }
    
    // MARK: - Reuse
    
}
