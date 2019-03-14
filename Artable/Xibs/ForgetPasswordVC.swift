//
//  ForgetPasswordVC.swift
//  Artable
//
//  Created by Matthew Sutton on 3/2/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit
import Firebase

class ForgetPasswordVC: UIViewController {

    @IBOutlet var emailTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func cancelClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        guard let email = emailTxtField.text, email.isNotEmpty else {
            simpleAlert(title: "Error", message: "Please enter email.")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                Auth.auth().handleFireAuthError(error: error, vc: self)
                debugPrint(error)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}
