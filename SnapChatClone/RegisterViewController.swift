//
//  RegisterViewController.swift
//  SnapChatClone
//
//  Created by Wilmer sinchi on 6/26/19.
//  Copyright © 2019 Wilmer sinchi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if let error = error
            { 
                print(error.localizedDescription)
            }else {
                if let user = user{ Database.database().reference().child("users").child(user.user.uid).child("email").setValue(user.user.email)
                    self.presentAlert(alert: "Sign up was a succesfull, please go back to home page")
                    print("Sign up was succesfull")
                }
                }
            }
        }
    
    
    func presentAlert(alert: String) {
        //        let alertController =
        let alertVC = UIAlertController(title: "Success", message: alert, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion:nil)
        }
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)
    }
        
        
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
