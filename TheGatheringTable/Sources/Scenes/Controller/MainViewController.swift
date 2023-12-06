import UIKit
import SnapKit

class MainViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = "Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Configure
    
}

// MARK: - Extensions
