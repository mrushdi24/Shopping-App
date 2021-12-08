

import UIKit

class CartTotalPriceManager{
    
    private var cartProducts = [ProductModel]()
    private var quantities = [Int]()
    private var totalPrice:Float = 0.0
    
    init(cartProducts: [ProductModel]){
        self.cartProducts = cartProducts
    }
    
    //Mark:- Fill quantities arry of every item quantity in cart
    func fillQuantities(quanitity: String){
        let count = Int(quanitity)!
        quantities.append(count)
    }
    //Mark:- set certain index in quantities arry with another number
    func setQuantitiesIndex(index:Int, quanitity: String){
        let count = Int(quanitity)!
        quantities[index] = count
    }
    //Mark:- Update single item price
    func updateItemPrice(index: Int)-> Float{
        let itemTotal = Float(quantities[index]) * Float(cartProducts[index].price ?? 0.0)
        return itemTotal
    }
    //Mark:- Update Subtotal price
    func updateSubTotalPrice()-> Float{
        var subTotal:Float = 0.0
        for index in 0...cartProducts.count - 1 {
            subTotal = subTotal + updateItemPrice(index: index)
        }
        let total = Double(round(1000 * Double(subTotal)) / 1000)
        return Float(total)
    }
    //Mark:- Update total price
    func updateTotalPrice(subTotal:Float,shippingCost: Float, discountCoupon: Float)-> Float{
        let total = subTotal + shippingCost - discountCoupon
        return total
    }
    
    
    //-----------------------
    //Mark:- Sum single item price
    func countItemPrice(product: ProductModel, quantity: String)-> Float{
        let itemTotal = Float(quantity)! * Float(product.price ?? 0.0)
        return itemTotal
    }
    //Mark:- Set Total price
    func setTotalPrice(itemTotal: Float){
        totalPrice += itemTotal
    }
    //Mark:- get Total price
    func getTotalPrice()->Float{
        return totalPrice
    }
    //Mark:- rest Total price with value zero
    func resetTotalPrice(){
        totalPrice = 0
    }
}
