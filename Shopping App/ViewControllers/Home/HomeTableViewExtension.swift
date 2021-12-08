



import UIKit

extension  HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  screen.width / 1.8
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 || section == 2 || section == 3 || section == 4{
            return 50
        } else {
            return 0
        }
    }
 
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerHeight = tableView.sectionHeaderHeight
        let headerBg = UIView()
        headerBg.frame = CGRect(x: 0, y: 0, width: screen.width, height: headerHeight)
        headerBg.backgroundColor = .clear
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        headerBg.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: headerBg.topAnchor, constant: 0),
            title.leadingAnchor.constraint(equalTo: headerBg.leadingAnchor, constant: paddingSpace),
        ])
        title.font = UIFont(name: "Arial Bold", size: 16)
        
        
        let sectionDescription = UILabel()
        sectionDescription.translatesAutoresizingMaskIntoConstraints = false
        headerBg.addSubview(sectionDescription)
        NSLayoutConstraint.activate([
            sectionDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            sectionDescription.leadingAnchor.constraint(equalTo: title.leadingAnchor, constant: 0),
        ])
        sectionDescription.font = UIFont(name: "Arial", size: 13)
        sectionDescription.textColor = .lightGray
        
        
        
        if section == 0 {
            title.text = "Men"
            sectionDescription.text = "Men's fashion"
        }else if section == 1 {
            title.text = "Women"
            sectionDescription.text = "Women's new brands"
        }else if section == 2 {
            title.text = "Jewelery"
            sectionDescription.text = "Fashionable and new Jewelary "
        }else if section == 3 {
            title.text = "Electronics"
            sectionDescription.text = "Electronics & home appeals"
        }else {
            title.text = ""
            sectionDescription.text = ""
        }
       
        return headerBg
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeVC.MainTableCellIdent, for: indexPath) as! MenTableCell
            cell.isSelected = true
            cell.productCellSelect = self
            cell.updateCartCount = self
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeVC.WomenTableCellIdent, for: indexPath) as! WomenTableCell
            cell.isSelected = true
            cell.productCellSelect = self
            cell.updateCartCount = self
            return cell
        }else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeVC.JewelTableCellIdent, for: indexPath) as! JewelTableCell
            cell.isSelected = true
            cell.productCellSelect = self
            cell.updateCartCount = self
            return cell
        }else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeVC.ElectroTableCellIdent, for: indexPath) as! ElectTableCell
            cell.isSelected = true
            cell.productCellSelect = self
            cell.updateCartCount = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeVC.EmptyCellIdent, for: indexPath) as! BaseTableCell
            cell.isSelected = true
            return cell
        }
    }
    
}
