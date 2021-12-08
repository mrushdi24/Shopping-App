



import UIKit

class Helpers {
    
    static func setShadow(view: UIView, color: UIColor, opacity: Float, radius: CGFloat, width: CGFloat, height: CGFloat) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.layer.shadowOffset = CGSize(width: width, height: height)
    }
    
    static func setImageTint(imageview: UIImageView, color: UIColor){
        let templateImage = imageview.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        imageview.image = templateImage
        imageview.tintColor = color
    }
    static func setRate(_ rate: Float)-> String{
        let result = ceil(rate)
        if result == 1 {
            return "★☆☆☆☆"
        }else if result == 2 {
            return "★★☆☆☆"
        }else if result == 3 {
            return "★★★☆☆"
        }else if result == 4 {
            return "★★★★☆"
        }else if result == 5 {
            return "★★★★★★"
        }else {
            return ""
        }
    }
    
    
}
