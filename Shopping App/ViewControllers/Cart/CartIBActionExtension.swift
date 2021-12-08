


import UIKit


extension CartVC: CartCellProtocol, SHopNowProtocol {
    
    func incrementQuantity(index: Int, cell: CartTableCell) {
        let count = Int(cell.quantity.text!)
        cell.quantity.text = String(count! + 1)
        let quan = cell.quantity.text ?? "1"
        updateTotalinChekout(quan, index)
    }
    func decrementQuantity(index: Int, cell: CartTableCell) {
        let count = Int(cell.quantity.text!)
        if count != 1 {
            cell.quantity.text = String(count! - 1)
            let quan = cell.quantity.text ?? "1"
            updateTotalinChekout(quan, index)
        }else {
            
        }
    }
    func sumTotalPrice(){
        let totalSum = cartTotal.getTotalPrice()
        let subtotal = Double(round(1000 * Double(totalSum)) / 1000)
        self.checkOutView.subTotal.text = "$\(String(subtotal))"
        self.checkOutView.total.text = "$\(String(subtotal + 30))"
    }
    
    func updateTotalinChekout(_ quan:String, _ index:Int){
        cartTotal.setQuantitiesIndex(index: index, quanitity: quan)
        let subTotalPrice = cartTotal.updateSubTotalPrice()
        let totalPrice = cartTotal.updateTotalPrice(subTotal: subTotalPrice, shippingCost: 30, discountCoupon: 30)
        self.checkOutView.subTotal.text = "$\(String(subTotalPrice))"
        self.checkOutView.total.text = "$\(String(totalPrice))"
    }
    func resetCheckOut(){
        self.checkOutView.subTotal.text = "$0"
        self.checkOutView.total.text = "$0"
    }
    func removEmptyView(){
        self.tableView.alpha = 1
        self.checkOutView.alpha = 1
        self.emptyCartView.alpha = 0
    }
    func addEmptyView(){
        self.tableView.alpha = 0
        self.checkOutView.alpha = 0
        self.emptyCartView.alpha = 1
        self.cartButton.addBadge("0")
    }
    func ShopNow() {
        self.dismiss(animated: true, completion: nil)
    }
    //Mark:- dismiss Cart VC
    @objc func dismissCartVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
}


