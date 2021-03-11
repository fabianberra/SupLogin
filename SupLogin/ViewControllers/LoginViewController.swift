//
//  LoginViewController.swift
//  SupLogin
//
//  Created by Fabian on 2021-02-23.
//  Copyright © 2021 Fabian. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        //göm felmeddelandet
        errorLabel.alpha = 0
        
        //ge elementen en stil
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    
    }
    


    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //validate txtfield
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
    
        
        //signing in the user
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            
            else {
                
                let homeVievController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeVievController) as? HomeViewController
                
                self.view.window?.rootViewController = homeVievController
                self.view.window?.makeKeyAndVisible()
                
            }
            
        }
    }
    
}
