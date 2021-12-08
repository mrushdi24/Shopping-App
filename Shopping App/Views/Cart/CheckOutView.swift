



import UIKit

class CheckOutView: BaseView {
    lazy var totalCaption: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 15)
        view.textColor = .lightGray
        view.text = "Total:"
        return view
    }()
    
    lazy var total: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial Bold", size: 16)
        view.textColor = .black
        view.text = "$0.0"
        return view
    }()
    
    lazy var subTotalCaption: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 14)
        view.textColor = .lightGray
        view.text = "Sub Total:"
        return view
    }()
    
    lazy var subTotal: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial Bold", size: 14)
        view.textColor = .gray
        view.text = "$0.0"
        return view
    }()
    
    lazy var shippingCaption: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 14)
        view.textColor = .lightGray
        view.text = "Shipping Costs:"
        return view
    }()
    
    lazy var shipping: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial Bold", size: 14)
        view.textColor = .gray
        view.text = "$30"
        return view
    }()
    
    
    lazy var checkOuttButton:UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 18
        view.backgroundColor = .MainTheme
        view.titleLabel?.textColor = .white
        view.tintColor = .white
        view.setTitle("Check Out", for: .normal)
//        view.addTarget(self, action: #selector(incQuantity), for: .touchUpInside)
        return view
    }()
    
    
    
    override func setupViews(){
        
    }
    override func addSubViews(){
        addSubview(subTotalCaption)
        addSubview(subTotal)
        addSubview(totalCaption)
        addSubview(total)
        addSubview(shippingCaption)
        addSubview(shipping)
        addSubview(checkOuttButton)
    }
    override func setupConstraints(){
        NSLayoutConstraint.activate([
            subTotalCaption.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            subTotalCaption.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: paddingSpace * 1.5),
        ])
        NSLayoutConstraint.activate([
            subTotal.topAnchor.constraint(equalTo: subTotalCaption.topAnchor, constant: 0),
            subTotal.leadingAnchor.constraint(equalTo: subTotalCaption.trailingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            shipping.topAnchor.constraint(equalTo: subTotalCaption.topAnchor, constant: 0),
            shipping.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(paddingSpace * 1.5)),
        ])
        NSLayoutConstraint.activate([
            shippingCaption.topAnchor.constraint(equalTo: subTotalCaption.topAnchor, constant: 0),
            shippingCaption.trailingAnchor.constraint(equalTo: shipping.leadingAnchor, constant: -10),
        ])
        NSLayoutConstraint.activate([
            totalCaption.topAnchor.constraint(equalTo: subTotalCaption.topAnchor, constant: 27),
            totalCaption.leadingAnchor.constraint(equalTo: subTotalCaption.leadingAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            total.topAnchor.constraint(equalTo: totalCaption.topAnchor, constant: 0),
            total.leadingAnchor.constraint(equalTo: totalCaption.trailingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            checkOuttButton.topAnchor.constraint(equalTo: totalCaption.bottomAnchor, constant: 20),
            checkOuttButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            checkOuttButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            checkOuttButton.heightAnchor.constraint(equalToConstant: 36),
        ])
        
    }
}
