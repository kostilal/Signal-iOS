//
//  CreateWalletViewController.swift
//  Wallet
//
//  Created by Костюкевич Илья on 6/29/18.
//  Copyright © 2018 Ilya Kostyukevich. All rights reserved.
//

import UIKit
import BitcoinKit

class CreateWalletViewController: UIViewController {
    var address: Address?
    @IBOutlet var mnemonicLabels: [UILabel]!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton.dropShadow(color: UIColor.Common.navBarShadow,
                              opacity: 1,
                              offSet: CGSize(width: 3.0, height: 3.0),
                              radius: 4)
        
        DataManager.shared.createWallet(currencyType: .bitcoin) { (address) in
            self.address = address
            self.generateSeed()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func generateSeed() {
        if let mnemonic = address?.mnemonic {
            for (mnemonic, label) in zip(mnemonic, mnemonicLabels) {
                label.text = mnemonic
            }
        } else {
            let alert = UIAlertController(title: "Crypto Error", message: "Failed to generate random seed. Please try again later.", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        guard let address = self.address else { return }
        
        saveWallet(address: address.address)
        
        DataManager.shared.saveWallet(address: address)
        
        dismiss(animated: false, completion: nil)
    }
    
    func saveWallet(address: String) {
        let json: [String: Any] = ["walletType": "BTC",
                                   "walletAddress": address]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: "https://messenger.bitcostar.com/v1/wallets/")!
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
    }
}
