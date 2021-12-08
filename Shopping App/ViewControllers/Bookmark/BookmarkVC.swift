



import UIKit
import CoreData


class BookmarkVC: BaseVC{
    
    var bookmarkHandle: HandleBookmarkData!
    var managedObjextContext:NSManagedObjectContext!
    var bookMarkData = [Bookmark]()
    var data = [ProductModel]()
    var bookmargManager: BookMarkManager!
    var cartManager: CartManager!
    
    lazy var emptyView: EmptyBookmarkView = {
        let view = EmptyBookmarkView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.0
        return view
    }()
    
    lazy var tableHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .MainLightGray
        return view
    }()
    lazy var tableFooter: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var closeButton:UIButton = {
        let view = UIButton(type: .system)
        view.frame =  CGRect(x: 0, y: 0, width: 20, height: 20)
        view.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.addTarget(self, action: #selector(dismissBookmarkVC), for: .touchUpInside)
        view.tintColor = .black
        return view
    }()
    
    //Mark:- TableView cell Identidfiers
    static let TableCellIdent = "TableCellIdent"
    
    
    //Mark:- Setup Views
    override func setupViews(){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        fetchData()
    }
    //Mark:- Add Subview to Main View
    override func addSubViews(){
        view.addSubview(tableView)
        view.addSubview(emptyView)
    }
    //Mark:- Setup Navigation Controller
    override func setupNavigationBar(){
        setNavigationBar()
        navigationHideOnSwip()
        title = "Bookmark"
        let leftButton = UIBarButtonItem.init(customView: closeButton)
        self.navigationItem.leftBarButtonItem = leftButton
    }
    //Mark:- Setup Tableview
    override func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableFooter.frame = CGRect(x: 0, y: 0, width: screen.width, height: 70)
        tableHeader.frame = CGRect(x: 0, y: 0, width: screen.width, height: 10)
        tableView.tableHeaderView = tableHeader
        tableView.tableFooterView = tableFooter
        tableView.register(BookMarkTableCell.self, forCellReuseIdentifier: BookmarkVC.TableCellIdent)
    }
    override func setupConstraints(){
        //Mark:- tableView Layout Constrain
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        //Mark:- EmptyCartView LayoutConstrain
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    func fetchData(){
       let bookmarkRequest:NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
       do {
           bookMarkData = try managedObjextContext.fetch(bookmarkRequest)
           if bookMarkData.count == 0 {
               addEmptyView()
           }else {
               removEmptyView()
           }
           bookmarkHandle = HandleBookmarkData(bookmarkData: bookMarkData)
           bookmarkHandle.formatBookmark(){ model in
               self.data = model
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
       }catch {
           print("Could not load data from database \(error.localizedDescription)")
       }
    }
}






