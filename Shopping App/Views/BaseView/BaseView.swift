
import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        addSubViews()
        setupTableView()
        setupCollectionView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
    }
    func addSubViews(){
    }
    func setupTableView(){
    }
    func setupCollectionView(){
    }
    func setupConstraints(){
    }
}
