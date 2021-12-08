



import UIKit


extension BookmarkVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookmarkVC.TableCellIdent, for: indexPath) as! BookMarkTableCell
        let model =  data[indexPath.row]
        ImageCaching.KingFisher(cell.thump, model.image ?? "")
        cell.title.text = model.title
        cell.price.text = "$\(model.price ?? 0)"
        cell.rate.text = Helpers.setRate(model.rating.rate ?? 0)
        cell.cartButton.tag = indexPath.row
        cell.addToCart = self
        
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
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let model =  data[indexPath.row]
        self.bookmargManager = BookMarkManager(model: model)
            if editingStyle == .delete {
                self.bookmargManager.deleteBokmark(){ isdeleted in
                    self.fetchData()
                }
            }
    }


}

