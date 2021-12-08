




import UIKit
import CoreData


class CartVC: BaseVC{
    
    var cartHandle: HandleCartData!
    var cartTotal: CartTotalPriceManager!
    var deleteCartItem: CartManager!
    var cartCount =  CartCount()
   
    
    
    var managedObjextContext:NSManagedObjectContext!
     var savedCartData = [MyCart]()
     var cartData = [ProductModel]()
    
  
    lazy var emptyCartView: EmptyCartView = {
        let view = EmptyCartView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.0
        return view
    }()
    lazy var checkOutView: CheckOutView = {
        let view = CheckOutView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.0
        return view
    }()
    lazy var tableHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .MainBgGray
        return view
    }()
    lazy var tableFooter: UIView = {
        let view = UIView()
        view.backgroundColor = .MainBgGray
        return view
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.alpha = 0.0
        return tableView
    }()
    
    lazy var closeButton:UIButton = {
        let view = UIButton(type: .system)
        view.frame =  CGRect(x: 0, y: 0, width: 20, height: 20)
        view.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.addTarget(self, action: #selector(dismissCartVC), for: .touchUpInside)
        view.tintColor = .black
        return view
    }()
    
    lazy var cartButton:UIButton = {
        let view = UIButton(type: .system)
        view.frame =  CGRect(x: 0, y: 0, width: 20, height: 20)
        view.setImage(UIImage(named: "mycart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    
 
    //Mark:- tableView cell Identidfiers
    static let TableCellIdent = "TableCellIdent"
    //Mark:- Setup Views
    override func setupViews(){
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        emptyCartView.shopDelegate = self
        fetchData()
    }
    //Mark:- Add Subview to Main View
    override func addSubViews(){
        view.addSubview(tableView)
        view.addSubview(checkOutView)
        view.addSubview(emptyCartView)
    }
    //Mark:- Setup Navigation Controller
    override func setupNavigationBar(){
        setNavigationBar()
        navigationHideOnSwip()
        title = "My Cart"
        cartButton.addBadge(cartCount.numberOfItemsInCart())
        let rightButton = UIBarButtonItem.init(customView: cartButton)
        let leftButton = UIBarButtonItem.init(customView: closeButton)
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.leftBarButtonItem = leftButton
    }
    //Mark:- Setup Tableview
    override func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .MainBgGray
        tableFooter.frame = CGRect(x: 0, y: 0, width: screen.width, height: 220)
        tableHeader.frame = CGRect(x: 0, y: 0, width: screen.width, height: 10)
        tableView.tableHeaderView = tableHeader
        tableView.tableFooterView = tableFooter
        tableView.register(CartTableCell.self, forCellReuseIdentifier: CartVC.TableCellIdent)
    }
    //Setup Views Constraintlayout
    override func setupConstraints(){
        //Mark:- tableView LayoutConstrain
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        //Mark:- checkOutView LayoutConstrain
        NSLayoutConstraint.activate([
            checkOutView.heightAnchor.constraint(equalToConstant: 170),
            checkOutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            checkOutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            checkOutView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        //Mark:- EmptyCartView LayoutConstrain
        NSLayoutConstraint.activate([
            emptyCartView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            emptyCartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            emptyCartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            emptyCartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    //Mark:-Fectch data from Cart Handler
    func fetchData(){
       let cartRequest:NSFetchRequest<MyCart> = MyCart.fetchRequest()
       do {
           savedCartData = try managedObjextContext.fetch(cartRequest)
           if savedCartData.count == 0 {
               addEmptyView()
               self.resetCheckOut()
           }else {
               removEmptyView()
           }
           cartHandle = HandleCartData(cartData: savedCartData)
           cartHandle.formatCartData(){ model in
               self.cartData = model
               self.cartTotal = CartTotalPriceManager(cartProducts: model)
               self.cartTotal.resetTotalPrice()
               DispatchQueue.main.async {
                   self.tableView.reloadData()
                   self.cartButton.addBadge(self.cartCount.numberOfItemsInCart())
                   DispatchQueue.main.async {
                       self.sumTotalPrice()
                   }
               }
           }
       }catch {
           print("Could not load data from database \(error.localizedDescription)")
       }
    }

    
    

}




