



import UIKit

extension  HomeVC: ProductCellSelectProtocol, UpdateCartCountProtocol {
    //Mark:- Call Detail VC
    func presentProductDetail(_ model: ProductModel) {
       
    }
    //Mark:- Update cart count in cart Button badge
    func UpdateCartCount() {
        cartButton.addBadge(cartCount.numberOfItemsInCart())
    }
    //Mark:- Open Cart VC
    @objc func openCartVC(){
        let cartVC = CartVC()
        let navigation = UINavigationController(rootViewController: cartVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    //Mark:- Open Bookmark VC
    @objc func openBookmarkVC(){
        let bookmarkVC = BookmarkVC()
        let navigation = UINavigationController(rootViewController: bookmarkVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
}

