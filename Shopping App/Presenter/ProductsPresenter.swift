

import UIKit

protocol PoductsProtocol: class {
    func fetchDataSucces()
}

class ProductsPresenter {
    private weak var delegate: PoductsProtocol?
    private var products = [ProductModel]()
    
    init(delegate: PoductsProtocol) {
        self.delegate = delegate
    }
    
    func fetchData(_ url: String){
            ProductInteractor<ProductModel>().fetchData(url: url){ data in
                 if let data = data {
                    self.products = data
                    self.delegate?.fetchDataSucces()
                 }
             }
    }
    func numberOfRowsInSection()->Int{
        return products.count
    }
    func getData(_ indexPath: Int)-> ProductModel{
        return products[indexPath]
    }
}
