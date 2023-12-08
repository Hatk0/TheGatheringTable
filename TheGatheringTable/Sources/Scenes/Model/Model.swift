import Foundation

// MARK: - Card

struct Card: Decodable {
    let cards: [CardElement]
}

// MARK: - CardElement

struct CardElement: Decodable {
    let name: String
    let type: String
    let rarity: String
    let text: String
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name, type, rarity, text
        case imageURL = "imageUrl"
    }
}
