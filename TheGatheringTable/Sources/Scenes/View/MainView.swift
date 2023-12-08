import UIKit
import SnapKit

final class MainView: UIView {
    
    // MARK: - UI
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
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
        addSubview(searchBar)
        addSubview(searchButton)
        addSubview(mainTableView)
    }
    
    private func setupLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        searchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(searchBar)
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    // MARK: - Action
    
    @objc
    func buttonTapped() {
        
    }
}

// MARK: - Extensions

extension MainView: UISearchBarDelegate {
    
}
