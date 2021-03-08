//
//  LoginViewController.swift
//  SupLogin
//
//  Created by Fabian on 2021-02-23.
//  Copyright © 2021 Fabian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
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
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleFilledButton(loginButton)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
}
