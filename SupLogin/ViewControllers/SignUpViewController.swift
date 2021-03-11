//
//  SignUpViewController.swift
//  SupLogin
//
//  Created by Fabian on 2021-02-23.
//  Copyright © 2021 Fabian. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

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
    
// check the fields and validate that the data is correct
    func validateFields()-> String?{
       // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        //Check if password is in the correct format.
        
        let cleanedPassword = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            //password does not meet up with the requirements
            
            return "Please make sure your password is atleast 8 characters, contains special character and a number. "
        
        }
        
        // add regex for email
        
        return nil
    }
 
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate the fields
        
        let error = validateFields()
        
        if error != nil {
            
            //there was an error
            showError(error!)
        }
        
        else {
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create the user
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if let err = err {
                    self.showError("Error creating user")
                }
                else{
                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.showError("error saving user data")
                        }
                    }
                    
                    self.transitionToHome()
                    
                    
                }
            }
                   
            //transition to the homescreen
            
        }
        
        
    }
    
    func showError(_ message: String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        let homeVievController = storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeVievController) as? HomeViewController
        
        view.window?.rootViewController = homeVievController
        view.window?.makeKeyAndVisible()
        
    }
    
    
}
