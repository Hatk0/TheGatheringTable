import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    private var mainView: MainView?
    
    var card = [CardElement]()

    // MARK: - Lifecycle
    
    override func loadView() {
        mainView = MainView()
        mainView?.mainViewController = self
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configure()
        fetchCard()
        setupSearchHandler()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        title = "Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Methods
    
    private func setupSearchHandler() {
        mainView?.searchActionHandler = { [weak self] searchText in
            self?.searchForCard(with: searchText)
        }
    }
    
    func fetchCard() {
        CardManager.shared.fetchCard { [weak self] cards in
            if let cards = cards {
                self?.card = cards
                self?.mainView?.mainTableView.reloadData()
            } else {
                self?.mainView?.showAlert(message: "Failed to fetch cards")
            }
        }
    }
    
    func searchForCard(with searchText: String) {
        guard !searchText.isEmpty else {
            fetchCard()
            return
        }

        let filteredCards = card.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        self.card = filteredCards
        mainView?.mainTableView.reloadData()
    }
    
    // MARK: - Configure
    
    private func configure() {
        mainView?.mainTableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        mainView?.mainTableView.dataSource = self
        mainView?.mainTableView.delegate = self
    }
}

// MARK: - Extensions

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return card.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath)
                as? MainCell else {
            return UITableViewCell()
        }
                
        let currentCardElement = card[indexPath.row]
                
        cell.cardElement = currentCardElement
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailedViewController = DetailedViewController()
        detailedViewController.cardElement = card[indexPath.row]
        present(detailedViewController, animated: true)
    }
}
