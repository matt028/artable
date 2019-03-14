//
//  RegisterVC.swift
//  Artable
//
//  Created by Matthew Sutton on 1/9/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    // Outlers
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var confirmPassTxt: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var passCheckImg: UIImageView!
    @IBOutlet var confirmPassCheckImg: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let passTxt = passwordTxt.text else { return }
        
        // If we have stated typing in the confirm pass text field
        if textField == confirmPassTxt {
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        } else {
            if passTxt.isEmpty {
                passCheckImg.isHidden = true
                confirmPassCheckImg.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        
        // Make it so when passwords match, the checkmarks turn green
        if passwordTxt.text == confirmPassTxt.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        } else {
            passCheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    
    // Create User
    @IBAction func registerBtnPressed(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
            let username = usernameTxt.text, username.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else {
                simpleAlert(title: "Error", message: "Please fill out all fields.")
                return
        }
        
        guard let confirmPass = confirmPassTxt.text, confirmPass == password else {
            simpleAlert(title: "Error", message: "Passwords do not match.")
            return
        }
        
        activityIndicator.startAnimating()
        
        guard let authUser = Auth.auth().currentUser else { return }
        
        // Linking an anonymous account with email/password
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        authUser.linkAndRetrieveData(with: credential) { (result, error) in
            if let error = error {
                Auth.auth().handleFireAuthError(error: error, vc: self)
                debugPrint(error.localizedDescription)
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
        
        // Sign in with email/password
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            if let error = error {
//                debugPrint(error)
//                return
//            }
//
//            self.activityIndicator.stopAnimating()
//            self.dismiss(animated: true, completion: nil)
//        }
    }
    

}
