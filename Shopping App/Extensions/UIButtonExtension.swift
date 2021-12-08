


import UIKit


extension UIButton {
    //Mark:- Add Count badge to Button
    func addBadge(_ num: String){
        let label = UILabel(frame: CGRect(x: -5, y: -8, width: 18, height: 18))
        label.backgroundColor = .MainTheme
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 9
        label.text = num
        if Int(num)! > 9 {
            label.font = UIFont(name: "Arial Bold", size: 10)
        }else {
            label.font = UIFont(name: "Arial Bold", size: 13)
        }
        label.textAlignment = .center
        label.textColor = .white
        self.addSubview(label)
    }
    
}
