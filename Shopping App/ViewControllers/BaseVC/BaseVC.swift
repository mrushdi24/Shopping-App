
import UIKit


class BaseVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViews()
        setupViews()
        setupTableView()
        setupNavigationBar()
        setupCollectionView()
        setupConstraints()
    }
   
    func setupViews(){
    }
    func addSubViews(){
    }
    func setupNavigationBar(){
    }
    func setupTableView(){
    }
    func setupCollectionView(){
    }
    func setupConstraints(){
    }
}
