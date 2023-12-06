import UIKit
import SnapKit

final class MainView: UIView {
    
    // MARK: - UI
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
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
        addSubview(mainTableView)
    }
    
    private func setupLayout() {
        mainTableView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
}
