



import UIKit

//Mark:- Product Collection cell Selection Protocol
protocol ProductCellSelectProtocol{
    func presentProductDetail(_ model: ProductModel)
}
//Mark:- Add to Cart From Home VC Protocol
protocol AddToCartFromMain {
    func AddToCart(index: Int, cell: ProductCollectionCell)
}
//Mark:- Add to Cart From Bookmark VC Protocol
protocol AddToCartFromBookMark {
    func AddToCart(index: Int, cell: BookMarkTableCell)
}
//Mark:- Cart cell Buttons Protocol
protocol CartCellProtocol {
    func incrementQuantity(index: Int, cell: CartTableCell)
    func decrementQuantity(index: Int, cell: CartTableCell)
}
//Mark:- Update cart Count In navigationbar cart button Protocol
protocol UpdateCartCountProtocol {
    func UpdateCartCount()
}
//Mark:- Shop Now Button Protocol
protocol SHopNowProtocol {
    func ShopNow()
}
