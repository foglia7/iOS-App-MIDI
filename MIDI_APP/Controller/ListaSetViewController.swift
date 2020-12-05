//
//  ListaSetViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 01/04/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ListaSetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var nameTextField : UITextField?
    var concerti: [Concert] = []
    var songs: [Song] = []
    var delegate: ModalDelegate?
    var testValue: String = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func displayAction(_ sender: Any) {
        let alertController = UIAlertController(title: "New set list", message: "insert new name", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: nameTextField)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: self.okHandler)
        let cancelAction = UIAlertAction (title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    func okHandler(alert: UIAlertAction) {
        //dismiss(animated: true, completion: nil)
        let nuovoConcerto = Concert();
        nuovoConcerto.nome = nameTextField?.text ?? "def"
        concerti.append(nuovoConcerto)
        
        if let delegate = self.delegate {
            delegate.updateArray(setlist: nuovoConcerto)
               
              }
       
        if nameTextField?.text != nil {
            DBManager.shared.writeConcerto(nome: nameTextField?.text ?? "def")
        }
      
        self.loadData()
        print(concerti)
    }
    
    func loadData() {
        // code to load data from network, and refresh the interface
        tableView.reloadData()
    }
    
    func nameTextField(textField : UITextField){
        nameTextField = textField
        nameTextField?.placeholder = "New set list name "
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.concerti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell: NomiConcertiTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! NomiConcertiTableViewCell
        
        cell.nomeConcerto.text = concerti[indexPath.row].nome
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       if let delegate = self.delegate {
        delegate.changeValue(value: indexPath.row)
        
       }
       dismiss(animated: true, completion: nil)
    }
    
    
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
         
    }
}
