

import UIKit


extension BookmarkVC: AddToCartFromBookMark, SHopNowProtocol {
    
    func AddToCart(index: Int, cell: BookMarkTableCell) {
        let model =  data[index]
        cartManager = CartManager(model: model)
        cartManager.AddToCart(quantity: "1"){ isSaved, isExisted in
            if isSaved {
                cell.cartButton.setBackgroundImage(UIImage(named: "cart_ok"), for: .normal)
            }
            if isExisted {
                cell.cartButton.setBackgroundImage(UIImage(named: "cart"), for: .normal)
                self.cartManager.deleteCart(){ isdeleted in
               }
            }
        }
    }
    //Mark:- dismiss Bookmark VC
    @objc func dismissBookmarkVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func removEmptyView(){
        self.tableView.alpha = 1
        self.emptyView.alpha = 0
    }
    func addEmptyView(){
        self.tableView.alpha = 0
        self.emptyView.alpha = 1
    }
    func ShopNow() {
        self.dismiss(animated: true, completion: nil)
    }
}

