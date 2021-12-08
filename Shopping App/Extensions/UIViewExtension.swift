





import UIKit


extension UIView {
    
    //Mark:- Set Round Corener in View
    func SetRoundCorner(corners: UIRectCorner, cornerRadius: Double) {
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
    //Mark:- Set View corner radius
    func setCornerRadius(radius: CGFloat){
        self.layer.cornerRadius = radius
    }
}
