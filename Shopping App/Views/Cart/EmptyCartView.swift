

import UIKit

class EmptyCartView: BaseView {
  
    var shopDelegate: SHopNowProtocol!
    lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Arial", size: 17)
        view.textColor = .lightGray
        view.text = "You have not \n Placed any order yet"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    
    lazy var thump: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "emptybag")
        return view
    }()
    
    
    lazy var shopButton:UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 18
        view.backgroundColor = .MainTheme
        view.titleLabel?.textColor = .white
        view.tintColor = .white
        view.setTitle("Shop Now", for: .normal)
        view.addTarget(self, action: #selector(shopNow), for: .touchUpInside)
        return view
    }()
    
    
    override func setupViews(){
        
    }
    override func addSubViews(){
        addSubview(title)
        addSubview(thump)
        addSubview(shopButton)
    }
    override func setupConstraints(){
      
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
        
        
        NSLayoutConstraint.activate([
            thump.topAnchor.constraint(equalTo: title.topAnchor, constant: 50),
            thump.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            thump.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            thump.heightAnchor.constraint(equalTo: self.widthAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            shopButton.topAnchor.constraint(equalTo: thump.bottomAnchor, constant: 0),
            shopButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            shopButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shopButton.heightAnchor.constraint(equalToConstant: 36),
        ])
        
    }
    
    
    @objc func shopNow(sender: UIButton){
        shopDelegate.ShopNow()
    }
}

