



import UIKit

class FrontFeatureView: BaseView {
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:  0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    static let FrontCollectionCellIdent = "FrontCollectionCellIdent"
    
    //Add subViews to main View
    override func addSubViews() {
        addSubview(bgView)
        bgView.addSubview(collectionView)
    }
    //Setup Views
    override func setupViews() {
      
        
    }
    override func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FrontCollectionCell.self, forCellWithReuseIdentifier: FrontFeatureView.FrontCollectionCellIdent)
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

}

extension  FrontFeatureView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FrontFeatureView.FrontCollectionCellIdent, for: indexPath) as! FrontCollectionCell
        cell.thump.image = UIImage(named: "frontbanner")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screen.width  , height:  self.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
