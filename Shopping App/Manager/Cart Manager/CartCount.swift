


import UIKit
import CoreData



class CartCount {
    private var cartData = [MyCart]()
    private var managedObjextContext:NSManagedObjectContext!
    
    //Mark:- get Cart number of items
    func numberOfItemsInCart()->String{
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let cartRequest:NSFetchRequest<MyCart> = MyCart.fetchRequest()
        do {
            cartData = try managedObjextContext.fetch(cartRequest)
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
        return String(cartData.count)
    }
    
}

