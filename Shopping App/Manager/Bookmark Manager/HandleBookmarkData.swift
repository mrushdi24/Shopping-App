


import UIKit



class HandleBookmarkData{
   
    private var bookmarkData = [Bookmark]()
    private var reversedData = [ProductModel]()
    
    init(bookmarkData: [Bookmark]){
        self.bookmarkData = bookmarkData
    }
    //Mark:- get Bookmark products and fetch its data from server
    func formatBookmark(completion :@escaping([ProductModel])->()){
      
        for index in 0..<bookmarkData.count {
            let productID = String(bookmarkData[index].id)
            ItemInteractor<ProductModel>().fetchOneData(url: "\(Api)\(productID)"){ data in
                     if let data = data {
                       self.reversedData.append(data)
                     }
                    DispatchQueue.main.async {
                        if self.reversedData.count != 0 {
                            completion(self.reversedData)
                        }
                    }
                 }
        }
    }
    
}

