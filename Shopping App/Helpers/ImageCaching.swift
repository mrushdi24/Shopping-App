

import UIKit
import Kingfisher


class ImageCaching {
    static func KingFisher(_ imgv: UIImageView ,_ url: String) {
        guard let url = URL(string: url) else {
            return
        }
        imgv.kf.indicatorType = .activity
        imgv.kf.setImage(with: url,placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
}
