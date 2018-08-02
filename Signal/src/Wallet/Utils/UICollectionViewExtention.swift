//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 88, height: 81))
        image.center = center
        image.image = UIImage(named: "im_ghost")
        
        let messageLabel = UILabel(frame: CGRect(x: 80, y: image.frame.size.height + 100, width: self.bounds.size.width, height: 30))
        messageLabel.text = message.localizedUppercase
        messageLabel.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.sizeToFit()
        
        let view = UIView(frame: frame)
        view.addSubview(image)
        view.addSubview(messageLabel)
        
        self.backgroundView = view
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
