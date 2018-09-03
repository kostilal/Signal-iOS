//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 150))
        view.center = center
        
        let image = UIImageView(frame: CGRect(x: view.center.x - 81/2, y: 20, width: 88, height: 81))
        image.image = UIImage(named: "im_ghost")
        
        let messageLabel = UILabel(frame: CGRect(x: 80, y: image.frame.size.height + 40, width: view.bounds.size.width, height: 30))
        messageLabel.text = message.localizedUppercase
        messageLabel.textColor = UIColor(red: 202/255, green: 202/255, blue: 202/255, alpha: 1)
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.sizeToFit()
        
        view.addSubview(image)
        view.addSubview(messageLabel)

        self.backgroundView = view
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
