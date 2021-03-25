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
    
    /*
    let storageRef = Storage.storage().reference(forURL:"//supparaply.appspot.com")
    let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
    
    private let storage = Storage.storage().reference()
    
    
            storage.child("images/file.png").putData(imageData,
                                                        metadata: nil,
                                                        completion: { _, error in
                                                            guard error == nil else {
                                                                print("Failed to upload")
                                                                return
                                                            }
                                                            self.storage.child("images/file.png").downloadURL(completion: { url, error in
                                                                guard let url = url, error == nil else {
                                                                    return
                                                                }
                                                                let urlString = url.absoluteString
                                                                print("Download URL:")
                                                            } )
            })
       
        
        }
        
    }
    
   
    // Kollar om användaren är inloggad och sparar
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            performSelector(#selector(handleLogout), withObject: nil, afterDelay: 0)
        }
    }
 */
    
    
}


