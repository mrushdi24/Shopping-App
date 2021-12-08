



import  UIKit
import  CoreData


class CartManager{
    
    private var managedObjextContext:NSManagedObjectContext!
    private var searchdata = [MyCart]()
    private let model: ProductModel
   

    init(model: ProductModel) {
        self.model = model
    }
    
    //Mark:- Add product to Cart
    func AddToCart(quantity: String, completion: @escaping (( _ isSaved: Bool, _ isExist: Bool)-> Void)){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let rearchRequest:NSFetchRequest<MyCart> = MyCart.fetchRequest()
        do {
            
            let predicate = NSPredicate(format: "id = %@", String(model.id ?? 0))
            rearchRequest.predicate = predicate
            searchdata = try managedObjextContext.fetch(rearchRequest)
            
            let count = searchdata.count
            if count == 0 {
                let bookItems = MyCart(context: managedObjextContext)
                bookItems.id = Int64(model.id ?? 0)
                bookItems.quantity = quantity
                                do {
                    try self.managedObjextContext.save()
                    completion(true, false)
                }catch {
                    print("Could not save data \(error.localizedDescription)")
                }
            }else if count == 1 {
                completion(false, true)
            }
            else{
               
            }
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
    }
    
    //Mark:- Search product in cart
    func searchCart(id: Int, completion: @escaping (( _ isExist: Bool)-> Void)){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let rearchRequest:NSFetchRequest<MyCart> = MyCart.fetchRequest()
        do {
            let predicate = NSPredicate(format: "id = %@", String(model.id ?? 0))
            rearchRequest.predicate = predicate
            searchdata = try managedObjextContext.fetch(rearchRequest)
            
            let count = searchdata.count
            if count == 0 {
               completion(false)
            }
            else if count == 1 {
                completion(true)
            }
            else{
                print("nooo")
            }
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
    }
    
    //Mark:- Delete product from Cart
    func deleteCart (completion: @escaping (( _ isDeleted: Bool)-> Void)){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let rearchRequest:NSFetchRequest<MyCart> = MyCart.fetchRequest()
        do {
            let predicate = NSPredicate(format: "id = %@", String(model.id ?? 0))
            rearchRequest.predicate = predicate
            do {
                searchdata = try managedObjextContext.fetch(rearchRequest)
                let deleted = searchdata[0]
                managedObjextContext.delete(deleted)
                try self.managedObjextContext.save()
                completion(true)
            }catch {
                print("Could not load data from database \(error.localizedDescription)")
            }
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
    }
    
}


