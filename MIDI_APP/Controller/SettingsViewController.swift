//
//  SettingsViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 06/04/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SettingsViewController: UIViewController {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var cognomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      let db = Firestore.firestore()
    let email = Auth.auth().currentUser?.email
          let uid = Auth.auth().currentUser?.uid
          
          emailLabel.text = "   " + email!
     
        
          
          let docRef = db.collection("users").document(uid!)
      

          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                  let nome = document.get("firstname") as! String
                  let cognome = document.get("lastname") as! String
                  
                  
                  self.nomeLabel.text = "   " +  nome
                  
                  self.cognomeLabel.text = "   " + cognome
                  print("HO STAMPATO NOME E COGNOME")
              } else {
                  print("Document does not exist")
              }
          }
   
             
             
             
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
       try! Auth.auth().signOut()
        
      let homeViewController = self.storyboard?.instantiateViewController(identifier: "startVC")
             
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
