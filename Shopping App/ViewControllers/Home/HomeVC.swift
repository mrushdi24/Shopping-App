



import UIKit


class HomeVC: BaseVC  {
    
    var cartCount =  CartCount()
    
    lazy var cartButton:UIButton = {
        let view = UIButton(type: .system)
        view.frame =  CGRect(x: 0, y: 0, width: 20, height: 20)
        view.setImage(UIImage(named: "mycart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.addTarget(self, action: #selector(openCartVC), for: .touchUpInside)
        view.tintColor = .black
        return view
    }()
    lazy var bookmarkButton:UIButton = {
        let view = UIButton(type: .system)
        view.frame =  CGRect(x: 0, y: 0, width: 20, height: 20)
        view.setImage(UIImage(named: "bookmark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.addTarget(self, action: #selector(openBookmarkVC), for: .touchUpInside)
        view.tintColor = .black
        return view
    }()
    
    lazy var frontFeatureView: FrontFeatureView = {
       let view = FrontFeatureView()
        view.frame = CGRect(x: 0, y: 0, width: screen.width, height: screen.width / 2.2)
        return view
    }()
    lazy var mianTableView: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    //Mark:-tableView cell Identidfiers
    static let MainTableCellIdent = "MainTableCellIdent"
    static let WomenTableCellIdent = "WomenTableCellIdent"
    static let ElectroTableCellIdent = "ElectroTableCellIdent"
    static let JewelTableCellIdent = "JewelTableCellIdent"
    static let EmptyCellIdent = "EmptyCellIdent"

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartButton.addBadge(cartCount.numberOfItemsInCart())
        
    }
    
    //Mark:-Add subViews to main View
    override func addSubViews() {
        view.addSubview(mianTableView)
    }
    //Mark:-Setup Views
    override func setupViews() {
        mianTableView.backgroundColor = .white
    }
    //Mark:-Setup Navigation Controller
    override func setupNavigationBar(){
        setNavigationBar()
        title = "Home"
        
        let rightButton = UIBarButtonItem.init(customView: cartButton)
        let leftButton = UIBarButtonItem.init(customView: bookmarkButton)
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.leftBarButtonItem = leftButton
    }
    //Mark:-Setup Views Constraintlayout
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            mianTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mianTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mianTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mianTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    //Mark:-Setup TableView
    override func setupTableView() {
        mianTableView.delegate = self
        mianTableView.dataSource = self
        mianTableView.separatorStyle = .none
        mianTableView.tableHeaderView = frontFeatureView
        mianTableView.register(BaseTableCell.self, forCellReuseIdentifier: HomeVC.EmptyCellIdent)
        mianTableView.register(MenTableCell.self, forCellReuseIdentifier: HomeVC.MainTableCellIdent)
        mianTableView.register(WomenTableCell.self, forCellReuseIdentifier: HomeVC.WomenTableCellIdent)
        mianTableView.register(ElectTableCell.self, forCellReuseIdentifier: HomeVC.ElectroTableCellIdent)
        mianTableView.register(JewelTableCell.self, forCellReuseIdentifier: HomeVC.JewelTableCellIdent)
    }
    //Mark:-A function called when presenter fetching data successfully
    func fetchDataSucces() {
       
    }
}



