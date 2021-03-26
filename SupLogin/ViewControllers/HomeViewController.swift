//
//  HomeViewController.swift
//  SupLogin
//
//  Created by Fabian on 2021-02-23.
//  Copyright © 2021 Fabian. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseStorage

class HomeViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Hälsar välkommen
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = Auth.auth().currentUser?.uid
        self.view.addSubview(label)
    
    
    }
    
    // Hämtar user id
    @IBAction func fetchName(){
        let userID : String = (Auth.auth().currentUser?.uid)!
            print("Current user ID is " + userID)
    }
    
    
    // Imagepicker för profilbilder
    @IBOutlet weak var profilePictureView: UIImageView!
    
    var imagePicker:UIImagePickerController!
    
    @IBAction func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profilePictureView.image = image
            }
        
        picker.dismiss(animated: true, completion: nil)
    }

}
