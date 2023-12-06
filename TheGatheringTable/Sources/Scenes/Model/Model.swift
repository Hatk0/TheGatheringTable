import Foundation

// MARK: - Card

struct Card: Codable {
    let cards: [CardElement]
}

// MARK: - CardElement

struct CardElement: Codable {
    let name: String
    let type: String
    let rarity: String
    let text: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name, type, rarity, text
        case imageURL = "imageUrl"
    }
}
