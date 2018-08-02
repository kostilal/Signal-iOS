//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import UIKit

class ChatTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTabs()
    }
    
    func setupUI() {
        tabBar.tintColor = .white
        tabBar.barTintColor = UIColor.ows_signalBrandBlue
        tabBar.isTranslucent = false
    }
    
    func setupTabs() {
        let homeViewController = HomeViewController()
        homeViewController.title = "CHAT"
        let signalNavigationController = SignalsNavigationController(rootViewController: homeViewController)
        signalNavigationController.tabBarItem = UITabBarItem(title: "CHAT", image: UIImage(named: "chat_tab_icon"), tag: 0)
        
        let walletNavigationController = UIStoryboard(name: "Wallet", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController")
        walletNavigationController.tabBarItem = UITabBarItem(title: "WALLET", image: UIImage(named: "wallet_tab_icon"), tag: 1)
        
        viewControllers = [signalNavigationController, walletNavigationController]
    }
}
