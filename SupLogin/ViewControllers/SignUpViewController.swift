//
//  SignUpViewController.swift
//  SupLogin
//
//  Created by Fabian on 2021-02-23.
//  Copyright © 2021 Fabian. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        
        //Göm felmeddelande
        errorLabel.alpha = 0
        
        
        //Ge elementen stil
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextfield)        
        Utilities.styleFilledButton(signUpButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signUpTapped(_ sender: Any) {
    }
    
    
}