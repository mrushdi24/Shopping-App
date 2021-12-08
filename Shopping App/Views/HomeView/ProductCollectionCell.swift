




import UIKit


protocol AddToBookmark {
    func AddToBookmark(index: Int, cell: ProductCollectionCell)
}

class ProductCollectionCell: BaseCollectionCell {
    
    var addToCart: AddToCartFromMain!
    var addToBookmark: AddToBookmark!
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    lazy var thump: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 12)
        view.numberOfLines = 2
        return view
    }()
    lazy var rate: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 13)
        view.textAlignment = .center
        view.textColor = .systemYellow
        return view
    }()
    lazy var price: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial Bold", size: 15)
        view.textColor = .MainTheme
        return view
    }()
    lazy var cartButton:UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12.5
        view.backgroundColor = .white
        view.setBackgroundImage(UIImage(named: "cart"), for: .normal)
        view.addTarget(self, action: #selector(AddToCart), for: .touchUpInside)
        return view
    }()
    lazy var bookMarkButton:UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 13
        view.addTarget(self, action: #selector(AddBookmark), for: .touchUpInside)
        return view
    }()
    
    //Add subViews to main View
    override func addSubViews() {
        addSubview(bgView)
        bgView.addSubview(thump)
        bgView.addSubview(bookMarkButton)
        bgView.addSubview(title)
        bgView.addSubview(rate)
        bgView.addSubview(price)
        bgView.addSubview(cartButton)
    }
    //Setup Views
    override func setupViews() {
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 8
        
        DispatchQueue.main.async {
            self.thump.SetRoundCorner(corners: [.topLeft, .topRight], cornerRadius: 8)
            Helpers.setShadow(view: self.bgView, color: .lightGray, opacity: 0.3, radius: 3, width: 1, height: 1)
            Helpers.setShadow(view: self.bookMarkButton, color: .lightGray, opacity: 0.3, radius: 3, width: 1, height: 1)
            Helpers.setShadow(view: self.cartButton, color: .lightGray, opacity: 0.3, radius: 3, width: 1, height: 1)
        }
    }
    //Setup Views Constraintlayout
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
        NSLayoutConstraint.activate([
            thump.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8),
            thump.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 6),
            thump.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -6),
            thump.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -90),
        ])
        NSLayoutConstraint.activate([
            bookMarkButton.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 6),
            bookMarkButton.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -6),
            bookMarkButton.heightAnchor.constraint(equalToConstant: 25),
            bookMarkButton.widthAnchor.constraint(equalToConstant: 25),
        ])
        NSLayoutConstraint.activate([
            price.leadingAnchor.constraint(equalTo: title.leadingAnchor, constant: 0),
            price.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -7),
        ])
        NSLayoutConstraint.activate([
            rate.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 0),
            rate.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 0),
            rate.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -6),
        ])
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: rate.topAnchor, constant: -7),
            title.leadingAnchor.constraint(equalTo: thump.leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: thump.trailingAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            cartButton.bottomAnchor.constraint(equalTo: price.bottomAnchor, constant: 0),
            cartButton.trailingAnchor.constraint(equalTo: title.trailingAnchor, constant: -5),
            cartButton.heightAnchor.constraint(equalToConstant: 26),
            cartButton.widthAnchor.constraint(equalToConstant: 26),
        ])
    }
    
    
    @objc func AddToCart(sender: UIButton){
        addToCart.AddToCart(index: sender.tag, cell: self)
    }
    @objc func AddBookmark(sender: UIButton){
        addToBookmark.AddToBookmark(index: sender.tag, cell: self)
        
    }

}

