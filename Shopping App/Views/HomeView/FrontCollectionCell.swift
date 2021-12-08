



import UIKit

class FrontCollectionCell: BaseCollectionCell {
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()

    lazy var thump: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        return view
    }()

    //Add subViews to main View
    override func addSubViews() {
        addSubview(bgView)
        bgView.addSubview(thump)
    }
    //Setup Views
    override func setupViews() {
        bgView.backgroundColor = .white
        thump.layer.cornerRadius = 7
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
            thump.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 7),
            thump.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: paddingSpace),
            thump.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -paddingSpace),
            thump.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -7),
        ])
       
       
    }

}
