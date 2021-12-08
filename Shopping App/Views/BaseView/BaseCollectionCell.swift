
import UIKit

class BaseCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        setupViews()
        addSubViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
    }
    func addSubViews(){
    }
    func setupConstraints(){
    }
}

