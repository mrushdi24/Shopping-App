


import UIKit


class HandleCartData{
   
    private var cartData = [MyCart]()
    private var reversedData = [ProductModel]()
    
    init(cartData: [MyCart]){
        self.cartData = cartData
    }
    //Mark:- get cart products and fetch its data from server
    func formatCartData(completion :@escaping([ProductModel])->()){
        var reversedData = [ProductModel]()
        for index in 0..<cartData.count {
            let productID = String(cartData[index].id)
            ItemInteractor<ProductModel>().fetchOneData(url: "\(Api)\(productID)"){ data in
                 if let data = data {
                   reversedData.append(data)
                 }
                DispatchQueue.main.async {
                    if reversedData.count == self.cartData.count {
                        completion(reversedData)
                    }
                }
             }
        }
    }
    
}

