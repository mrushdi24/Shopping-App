




import Foundation

struct ProductModel: Decodable {
    var id: Int?
    var title: String?
    var price: Float?
    var description: String?
    var category: String?
    var image: String?
    var rating: RatingModel
}

struct RatingModel: Decodable {
    var rate: Float?
    var count: Int?
}



