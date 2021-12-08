


import UIKit

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartVC.TableCellIdent, for: indexPath) as! CartTableCell
        let model =  cartData[indexPath.row]
        ImageCaching.KingFisher(cell.thump, model.image ?? "")
        cell.title.text = model.title
        cell.price.text = "$\(model.price ?? 0)"
        cell.rate.text = Helpers.setRate(model.rating.rate ?? 0)
        
        let quantity = savedCartData[indexPath.row].quantity
        cell.quantity.text = quantity
        
        cartTotal.fillQuantities(quanitity: quantity ?? "")
        let itemPrice =  cartTotal.countItemPrice(product: model, quantity: quantity ?? "1")
        cartTotal.setTotalPrice(itemTotal: itemPrice)
 
        cell.incrementButton.tag = indexPath.row
        cell.decrementButton.tag = indexPath.row
        cell.cartDelegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let model =  cartData[indexPath.row]
        self.deleteCartItem = CartManager(model: model)
            if editingStyle == .delete {
                self.deleteCartItem.deleteCart(){ isdeleted in
                    self.fetchData()
                }
            }
    }
}

