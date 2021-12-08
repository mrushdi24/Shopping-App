




import UIKit



class CartTableCell: BaseTableCell {
    
    var cartDelegate: CartCellProtocol!
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    lazy var incrementButton:UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 9
        view.backgroundColor = .black
        view.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        view.addTarget(self, action: #selector(incQuantity), for: .touchUpInside)
        return view
    }()
    lazy var decrementButton:UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 9
        view.backgroundColor = .black
        view.setBackgroundImage(UIImage(named: "minus"), for: .normal)
        view.addTarget(self, action: #selector(decQuantity), for: .touchUpInside)
        return view
    }()
    lazy var quantity: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial Bold", size: 16)
        view.textAlignment = .center
        view.text = "1"
        return view
    }()
    
    //Add subViews to main View
    override func addSubViews() {
        addSubview(bgView)
        bgView.addSubview(thump)
        bgView.addSubview(title)
        bgView.addSubview(rate)
        bgView.addSubview(price)
        bgView.addSubview(incrementButton)
        bgView.addSubview(decrementButton)
        bgView.addSubview(quantity)
    }
    //Setup Views
    override func setupViews() {
        backgroundColor = .MainBgGray
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 8
        DispatchQueue.main.async {
            Helpers.setShadow(view: self.bgView, color: .lightGray, opacity: 0.3, radius: 3, width: 1, height: 1)
            Helpers.setShadow(view: self.incrementButton, color: .lightGray, opacity: 0.3, radius: 3, width: 1, height: 1)
            Helpers.setShadow(view: self.decrementButton, color: .lightGray, opacity: 0.3, radius: 3, width: 1, height: 1)

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
            rate.bottomAnchor.constraint(equalTo: price.topAnchor, constant: -12),
        ])
        NSLayoutConstraint.activate([
            incrementButton.bottomAnchor.constraint(equalTo: price.bottomAnchor, constant: -7),
            incrementButton.trailingAnchor.constraint(equalTo: title.trailingAnchor, constant: -7),
            incrementButton.heightAnchor.constraint(equalToConstant: 18),
            incrementButton.widthAnchor.constraint(equalToConstant: 18),
        ])
        NSLayoutConstraint.activate([
            quantity.topAnchor.constraint(equalTo: incrementButton.topAnchor, constant: 0),
            quantity.bottomAnchor.constraint(equalTo: incrementButton.bottomAnchor, constant: 0),
            quantity.trailingAnchor.constraint(equalTo: incrementButton.leadingAnchor, constant: 0),
            quantity.widthAnchor.constraint(equalToConstant: 30),
        ])
        NSLayoutConstraint.activate([
            decrementButton.bottomAnchor.constraint(equalTo: incrementButton.bottomAnchor, constant: 0),
            decrementButton.trailingAnchor.constraint(equalTo: quantity.leadingAnchor, constant: 0),
            decrementButton.heightAnchor.constraint(equalToConstant: 18),
            decrementButton.widthAnchor.constraint(equalToConstant: 18),
        ])
        
    }
    
    @objc func decQuantity(sender: UIButton){
        cartDelegate.decrementQuantity(index: sender.tag, cell: self)
    }
    @objc func incQuantity(sender: UIButton){
        cartDelegate.incrementQuantity(index: sender.tag, cell: self)
    }
}

