






import UIKit


extension UIColor {
    
    
    public class var MainTheme: UIColor{
        return UIColor(hexString: "#ff527b")
    }
    public class var SecTheme: UIColor{
        return UIColor(hexString: "#ff4757")
    }
    public class var MainGray: UIColor{
        return UIColor(hexString: "#E8E8E8")
    }
    public class var MainLightGray: UIColor{
        return UIColor(hexString: "#f1f3f4")
    }
    public class var MainBgGray: UIColor{
        return UIColor(hexString: "#f8f9fa")
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


