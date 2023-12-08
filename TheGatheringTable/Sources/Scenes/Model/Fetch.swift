import Foundation
import Alamofire

class CardManager {
    static let shared = CardManager()
    
    private init() {}
    
    func fetchCard(completion: @escaping ([CardElement]?) -> Void) {
        let request = AF.request("https://api.magicthegathering.io/v1/cards")
        request.responseDecodable(of: Card.self) { response in
            switch response.result {
            case .success(let cardData):
                completion(cardData.cards)
            case .failure(let error):
                print("Error fetching card data:", error)
                completion(nil)
            }
        }
    }
}

class ImageLoader {
    static let shared = ImageLoader()
    
    private init() {}
    
    public func loadImage(from url: URL, into imageView: UIImageView) {
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)),
           let image = UIImage(data: cachedResponse.data) {
            imageView.image = image
        } else {
            AF.request(url).responseData { response in
                switch response.result {
                case .success(let imageData):
                    if let image = UIImage(data: imageData),
                       let httpResponse = response.response {
                        let cachedData = CachedURLResponse(response: httpResponse, data: imageData)
                        URLCache.shared.storeCachedResponse(cachedData, for: URLRequest(url: url))
                        
                        DispatchQueue.main.async {
                            imageView.image = image
                        }
                    }
                case .failure(let error):
                    print("Error fetching image: \(error)")
                    DispatchQueue.main.async {
                        imageView.image = UIImage(named: "square-image")
                    }
                }
            }
        }
    }
}
