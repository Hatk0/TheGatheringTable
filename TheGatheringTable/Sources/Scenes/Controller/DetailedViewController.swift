import UIKit

class DetailedViewController: UIViewController {
    
    private var detailedView: DetailedView?
    
    var cardElement: CardElement?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        detailedView = DetailedView()
        detailedView?.cardElement = cardElement
        view = detailedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 0.91, green: 0.80, blue: 0.66, alpha: 1.00)
    }
}
