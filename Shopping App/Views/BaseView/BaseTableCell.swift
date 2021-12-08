
import UIKit

class BaseTableCell: UITableViewCell {

  
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        selectionStyle = .none
        setupViews()
        addSubViews()
        setupCollectionView()
        setupConstraints()
    }
    func setupViews(){
    }
    func addSubViews(){
    }
    func setupCollectionView(){
    }
    func setupConstraints(){
        
    }

}
