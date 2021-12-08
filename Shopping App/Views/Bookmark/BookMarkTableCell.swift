



import UIKit



class BookMarkTableCell: BaseTableCell {
    
    var addToCart: AddToCartFromBookMark!
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .MainBgGray
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
        view.font = UIFont(name: "Arial", size: 16)
        view.numberOfLines = 2
        return view
    }()
    
    lazy var rate: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 14)
        view.textColor = .systemYellow
        return view
    }()
    lazy var price: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial Bold", size: 16)
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
    
    //Add subViews to main View
    override func addSubViews() {
        addSubview(bgView)
        bgView.addSubview(thump)
        bgView.addSubview(title)
        bgView.addSubview(rate)
        bgView.addSubview(price)
        bgView.addSubview(cartButton)
    }
    //Setup Views
    override func setupViews() {
        backgroundColor = .MainLightGray
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 8
        DispatchQueue.main.async {
            Helpers.setShadow(view: self.cartButton, color: .lightGray, opacity: 0.3, radius: 3, width: 1, height: 1)
        }
    }
    //Setup Views Constraintlayout
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: paddingSpace),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -paddingSpace),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
        NSLayoutConstraint.activate([
            thump.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8),
            thump.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5),
            thump.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8),
            thump.widthAnchor.constraint(equalTo: bgView.heightAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: thump.topAnchor, constant: 6),
            title.leadingAnchor.constraint(equalTo: thump.trailingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12),
        ])
        
        NSLayoutConstraint.activate([
            price.leadingAnchor.constraint(equalTo: title.leadingAnchor, constant: 0),
            price.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10),
        ])
        NSLayoutConstraint.activate([
            rate.leadingAnchor.constraint(equalTo: title.leadingAnchor, constant: 0),
            rate.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 0),
            rate.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -10),
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
    
}
