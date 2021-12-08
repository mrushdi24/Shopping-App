




import UIKit

class WomenTableCell: BaseTableCell {
    
    var productsPresenter: ProductsPresenter!
    var updateCartCount: UpdateCartCountProtocol!
    var bookMarkManager: BookMarkManager!
    var cartManager: CartManager!
    var productCellSelect: ProductCellSelectProtocol!
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .MainBgGray
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:  0, left: paddingSpace - 10, bottom: 0, right: paddingSpace)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        return collection
    }()
    
    static let ProductCollectionCellIdent = "FrontCollectionCellIdent"
    
    //Add subViews to main View
    override func addSubViews() {
        addSubview(bgView)
        bgView.addSubview(collectionView)
        backgroundColor = .white
    }
    //Setup Views
    override func setupViews() {
        productsPresenter = ProductsPresenter(delegate: self)
        productsPresenter.fetchData("\(Api)/category/women's%20clothing")
        
    }
    //Setup Navigation Controller
    override func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionCell.self, forCellWithReuseIdentifier: WomenTableCell.ProductCollectionCellIdent)
        collectionView.reloadData()
    }
    //Setup Views Constraintlayout
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
    
    
    func fetchDataSucces() {
        collectionView.reloadData()
    }

}

extension  WomenTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productsPresenter.numberOfRowsInSection()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WomenTableCell.ProductCollectionCellIdent, for: indexPath) as! ProductCollectionCell
        let model = self.productsPresenter.getData(indexPath.row)
        ImageCaching.KingFisher(cell.thump, model.image ?? "")
        cell.title.text = model.title
        cell.price.text = "$\(model.price ?? 0)"
        cell.rate.text = Helpers.setRate(model.rating.rate ?? 0)
        
        bookMarkManager = BookMarkManager(model: model)
        bookMarkManager.searchBookmark(title: model.title ?? ""){ isExist in
            if isExist {
                cell.bookMarkButton.setBackgroundImage(UIImage(named: "book_full"), for: .normal)
            } else {
                cell.bookMarkButton.setBackgroundImage(UIImage(named: "book_solid"), for: .normal)
            }
        }
        cartManager = CartManager(model: model)
        cartManager.searchCart(id: model.id ?? 0){ isExist in
            if isExist {
                cell.cartButton.setBackgroundImage(UIImage(named: "cart_ok"), for: .normal)
            }
            else {
                cell.cartButton.setBackgroundImage(UIImage(named: "cart"), for: .normal)
            }
        }
        cell.addToCart = self
        cell.addToBookmark = self
        cell.cartButton.tag = indexPath.item
        cell.bookMarkButton.tag = indexPath.item
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screen.width - 7 - 2 * paddingSpace) / 2  , height:  self.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.productsPresenter.getData(indexPath.item)
        productCellSelect.presentProductDetail(model)
    }
}



extension  WomenTableCell: PoductsProtocol, AddToCartFromMain, AddToBookmark {
  
    func AddToCart(index: Int, cell: ProductCollectionCell) {
        let model = self.productsPresenter.getData(index)
      
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
            self.updateCartCount.UpdateCartCount()
        }
    }
    func AddToBookmark(index: Int, cell: ProductCollectionCell) {
        let model = self.productsPresenter.getData(index)
        bookMarkManager = BookMarkManager(model: model)
        bookMarkManager.handleBookmark(){ isSaved, isDeleted in
            if isSaved {
                cell.bookMarkButton.setBackgroundImage(UIImage(named: "book_full"), for: .normal)
            }
            self.updateCartCount.UpdateCartCount()
            if isDeleted {
                cell.bookMarkButton.setBackgroundImage(UIImage(named: "book_solid"), for: .normal)
            }
        }
    }
  
}
