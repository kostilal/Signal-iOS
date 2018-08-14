//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import UIKit

@objc class DocumentPreviewViewController: UIViewController, UIDocumentInteractionControllerDelegate {

    @objc var filePath: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = filePath else {
            return
        }

        let dc = UIDocumentInteractionController(url: URL(fileURLWithPath: path as String))
        dc.delegate = self
        dc.presentPreview(animated: true)
    }

    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}
