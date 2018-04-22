//
//  RegisterViewController.swift
//  Toolify
//
//  Created by Hevin Jantasmin on 4/22/18.
//  Copyright © 2018 Hevin Febryo. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        navigationController?.navigationBar.barTintColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Buttons
    @IBAction func registerButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                let invalidAlert = UIAlertController(title: "Oops", message: "Invalid email address", preferredStyle: .alert)
                invalidAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(invalidAlert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "goToSearch", sender: self)
            }
        }
    }
    
    // MARK: - TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
