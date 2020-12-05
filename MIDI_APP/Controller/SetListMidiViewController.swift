//
//  SetListMidiViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 30/03/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit

protocol ModalDelegate {
    func changeValue(value: Int)
    func updateArray(setlist: Concert)
}

protocol MyCustomCellDelegator {
    func callSegueFromCell(myData dataobject: String)
}

class SetListMidiViewController: UIViewController, ModalDelegate, UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate, UNUserNotificationCenterDelegate {
    
    var songPressed:String = ""
    var songPressedObject:Song?
    var nameTextField:UITextField?
    var concerti: [Concert] = []
    var songs: [Song] = []
    var concertoScelto:Int = 0
    var concertoModificato = false
    var stringhina:String = " "
    var testValue: String = ""
    var liveModeEnabled: Bool = false
    var prova:String = ""
    
    var songsFirebase:[String] = []
    var concertiFirebase:[String] = []
    
    var datiFirebase: [[String]] = []
    
    func updateArray(setlist: Concert) {
        concerti.append(setlist)
    }
    
    
    @IBAction func presentViewController(_ sender: Any) {
        let presentedVC = storyboard?.instantiateViewController(withIdentifier: "listaSetViewController") as? ListaSetViewController
        presentedVC!.delegate = self
        presentedVC?.concerti = self.concerti
        //self.navigationController?.pushViewController(presentedVC!, animated: true)
        self.present(presentedVC!, animated: true, completion: nil)
    }
    
    func changeValue(value: Int) {
        concertoScelto = value
        print(concertoScelto)
        print("concerti agggiornati doipo aggiunta da pop over: \(concerti)")
        refreshVista()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("indice è \(concertoScelto)")
        
        if concerti.count == 0 {
            return 0
        } else {
            titoloConcerto.text = self.concerti[concertoScelto].nome
            
            return concerti[concertoScelto].songs.count
        }
        
        //return self.concerti[concertoScelto].songs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = self.concerti[concertoScelto].songs[indexPath.row]
        let cell: SongTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SongTableViewCell
        cell.nomeSong.text = song.title
        cell.numeroSongLabel.text = String(indexPath.row + 1)
        if let titolo = titoloConcerto.text{
            cell.titoloConcerto = titolo
        }
        cell.song = song
        cell.delegate = self
        print("questi sono i concerti \(self.concerti)")
        print("sto stampando la prova    \(prova)")
        return cell
    }
    
    
    
    @IBAction func presentDetail(_ sender: Any) {
        // let song = self.concerti[concertoScelto].songs[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController
        
        // vc?.titoloSong = song.title
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titoloConcerto: UILabel!
    @IBOutlet weak var liveButton: UIButton!
    
    
    @objc func functionName() {
        
        //refreshVista()
        print("notifichetta")
        print("this is \(concertoScelto)")
        print("printo la stringa  \(stringhina)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //updateConcerti()
        MIDIManager.shared.setUpMIDIConnection()
        queryFirebase()
        print("questi sono i concerti frate \(concerti)")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.functionName), name: NSNotification.Name(rawValue: "NotificationID"), object: nil)
    }
    
    func refreshVista(){
        
        self.tableView.reloadData()
        // self.titoloConcerto.text = self.concerti[concertoScelto].nome
        
    }
    
    @IBAction func liveButtonEnabled(_ sender: Any) {
        if liveModeEnabled == false{
            self.tableView.isScrollEnabled = false
            liveModeEnabled = true
            liveButton.alpha = 1
        } else {
            self.tableView.isScrollEnabled = true
            liveModeEnabled = false
            liveButton.alpha = 0.4
        }
        
        
    }
    @IBAction func editPress(_ sender: Any) {
        
        performSegue(withIdentifier: "seguetodetails", sender: self)
    }
    
    
    
    
    @IBAction func addSong(_ sender: Any) {
        let alertController = UIAlertController(title: "New song", message: "insert name", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: nameTextField)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: self.okHandler)
        let cancelAction = UIAlertAction (title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    func nameTextField(textField : UITextField){
        nameTextField = textField
        nameTextField?.placeholder = "New song name "
    }
    func okHandler(alert: UIAlertAction) {
        //dismiss(animated: true, completion: nil)
        //let nuovoConcerto = SetList.init(nome: nameTextField?.text ?? "def" , songs: [])
        //concerti.append(nuovoConcerto)
        
        let nuovaSong = Song()
        nuovaSong.title = nameTextField?.text ?? "def"
        nuovaSong.concert = self.concerti[concertoScelto]
        concerti[concertoScelto].songs.append(nuovaSong)
        tableView.reloadData()
        //addCanzoneFirebase(nome: nameTextField?.text ?? "def")
        DBManager.shared.writeCanzone(titolo: titoloConcerto.text!, nome: nameTextField?.text ?? "def")
        print(concerti)
    }
    
    
    //    func addCanzoneFirebase(nome: String){
    //
    //            if let uid = Auth.auth().currentUser?.uid {
    //                   let campo = self.db.collection("users").document(uid)
    //
    //                campo.collection("concerti").document(titoloConcerto.text!).collection("canzoni").document(nome).setData(["nome" : nome])
    //
    //                for n in 1...5 {
    //                campo.collection("concerti").document(titoloConcerto.text!).collection("canzoni").document(nome).collection("infoset").document(String(n)).setData([
    //                    "ch": "",
    //                    "prg": "",
    //                    "volume": "",
    //                ])
    //                }
    //
    //
    //    }
    //    }
    
    fileprivate func setupConcertList(concert: Concert, uid: String) {
        var arraySong: [Song] = []
        
        DBManager.shared.getSongsByConcert(concert: concert, completion: { (songs) in
            for song in songs {
                song.concert = concert
                arraySong.append(song)
                print("questo è l'arraySong: \(arraySong)")
            }
            
            //qua l'array va bene
            let nuovoConcerto = Concert()
            nuovoConcerto.nome = concert.nome
            for song in arraySong{
                nuovoConcerto.songs.append(song)
            }
            print("questo è il concerto: \(nuovoConcerto)")
            self.concerti.append(nuovoConcerto)
            self.prova = "è cambiato "
            arraySong = []
            print ("this is document id : \(concert.nome!)")
            
            
            
            self.tableView.reloadData()
            print("ho refreshato")
        })
    }
    
    func queryFirebase () {
        DBManager.shared.getConcertoList { (concerts) in
            print("faccio la query firebase")
            for concert in concerts {
                self.setupConcertList(concert: concert, uid: DBManager.shared.getCurrentUserId()!)
            }
        }
    }
}

extension SetListMidiViewController: SongTableViewCellDelegate {
    
    func btnEditTapped(with song: Song) {
        self.songPressed = song.title ?? "numero non trovato"
        self.songPressedObject = song
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        vc.indexConcerto = concertoScelto
        vc.titoloSong = songPressed
        vc.song = songPressedObject
        vc.titoloConcerto = titoloConcerto.text ?? ""
    }
    
    
}
