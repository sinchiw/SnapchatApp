//
//  ViewController.swift
//  SnapChatClone
//
//  Created by Wilmer sinchi on 6/25/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import FirebaseAuth


class LogInViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //fix this part
//        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func logInAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                self.presentAlert(alert: error!.localizedDescription)
                print(error!.localizedDescription)
            } else {
//                self.presentAlert(alert: error!.localizedDescription)
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromRight
                self.view.window!.layer.add(transition, forKey: nil)

                self.performSegue(withIdentifier:"moveToSnap", sender: nil)
//                 self.performSegue(withIdentifier: "moveToSnap", sender: nil)
                
                print("success")
            }
        }
        
       
        
        
    }
    
    func presentAlert(alert: String) {
//        let alertController =
        let alertVC = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion:nil)
        }
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}

