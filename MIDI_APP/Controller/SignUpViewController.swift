//
//  SignUpViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 04/04/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || secondNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        
        
        
        
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        //Validate fields
     let error = validateFields()
     
     if error != nil {
         
        showError(message: error!)
     }
     else {
         
         let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         let lastName = secondNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         
         
             //Crea l'utente
             Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
             
             //Controlla gli errori
             if err != nil {
                 
                self.showError(message: "Error creating user")
                 
             }
             else {
                 let db = Firestore.firestore()
                 
                 db.collection("users").document(result!.user.uid).setData(["firstname":firstName , "lastname": lastName , "uid" : result!.user.uid]) { (error) in
                     
                     if error != nil {
                        self.showError(message: "Error saving user data")
                     }
                     
                     
                 }
                 
                 self.transitionToHome()
                 
             }
         }
                
         
         
         
         //Transizione alla home
         
         
         
         
     }
     
     
        //Create the user
        
        //Trasnistion home
    }
        
    
    func showError(message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        let homeViewController = self.storyboard?.instantiateViewController(identifier: "mainVC")
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
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
