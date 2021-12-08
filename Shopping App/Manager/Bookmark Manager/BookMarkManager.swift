



import  UIKit
import  CoreData

class BookMarkManager{
    
    private var managedObjextContext:NSManagedObjectContext!
    private var searchdata = [Bookmark]()
    private let model: ProductModel
    
    init(model: ProductModel) {
        self.model = model
    }
    //Mark:- Add product to Bookmark
    func handleBookmark(completion: @escaping (( _ isSaved: Bool, _ isDeleted: Bool)-> Void)){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let searchRequest:NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        do {
            let predicate = NSPredicate(format: "title = %@", model.title ?? "")
            searchRequest.predicate = predicate
            searchdata = try managedObjextContext.fetch(searchRequest)
            let count = searchdata.count
            if count == 0 {
                let bookItems = Bookmark(context: managedObjextContext)
                bookItems.id = Int64(model.id ?? 0)
                bookItems.title = model.title
                                do {
                    try self.managedObjextContext.save()
                    completion(true, false)
                }catch {
                    print("Could not save data \(error.localizedDescription)")
                }
            }
            else if count == 1 {
                deleteBokmark(){ isDeleted in
                    if isDeleted {
                        completion(false, true)
                    }
                }
            }
            else{
                
            }
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
    }
    //Mark:- Delete product from Bookmark
    func deleteBokmark (completion: @escaping (( _ isDeleted: Bool)-> Void)){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let rearchRequest:NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        do {
            let predicate = NSPredicate(format: "title = %@", model.title ?? "")
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
    //Mark:- Search product in Bookmark
    func searchBookmark(title: String, completion: @escaping (( _ isExist: Bool)-> Void)){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let rearchRequest:NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        do {
            let predicate = NSPredicate(format: "title = %@", title)
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
                
            }
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
    }
}

