//
//  DetailViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 30/03/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import AudioUnit
import Foundation
import CoreMIDI
import AudioToolbox
import AVKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var canzoneEditataLabel: UILabel!
    var delegate: ModalDelegate?
    
    @IBOutlet weak var ch1: UITextField!
    @IBOutlet weak var ch2: UITextField!
    @IBOutlet weak var ch3: UITextField!
    @IBOutlet weak var ch4: UITextField!
    @IBOutlet weak var ch5: UITextField!
    
    @IBOutlet weak var prg1: UITextField!
    @IBOutlet weak var prg2: UITextField!
    @IBOutlet weak var prg3: UITextField!
    @IBOutlet weak var prg4: UITextField!
    @IBOutlet weak var prg5: UITextField!
    
    @IBOutlet weak var volume1: UITextField!
    @IBOutlet weak var volume2: UITextField!
    @IBOutlet weak var volume3: UITextField!
    @IBOutlet weak var volume4: UITextField!
    @IBOutlet weak var volume5: UITextField!
    
    
    
    
    @IBOutlet weak var fader1: UISlider!
    
    var firebaseData: [Infoset] = []
    
    @IBOutlet var chCollection: [UITextField]!
    @IBOutlet var prgCollection: [UITextField]!
    @IBOutlet var volumeCollection: [UITextField]!
    
    var indexConcerto: Int!
    var titoloSong : String = ""
    var song : Song?
    var titoloConcerto : String = ""
    var indexSong : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chCollection = [ch1,ch2,ch3,ch4,ch5]
        prgCollection = [prg1,prg2,prg3,prg4,prg5]
        volumeCollection = [volume1,volume2,volume3,volume4,volume5]
        canzoneEditataLabel.text = titoloSong
        queryFirebase()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var slider5: UISlider!
    
    @IBAction func slider1(_ sender: UISlider) {
        volume1.text = String(Int(sender.value))
    }
    @IBAction func slider2(_ sender: UISlider) {
        volume2.text = String(Int(sender.value))
    }
    @IBAction func slider3(_ sender: UISlider) {
        volume3.text = String(Int(sender.value))
    }
    @IBAction func slider4(_ sender: UISlider) {
        volume4.text = String(Int(sender.value))
    }
    @IBAction func slider5(_ sender: UISlider) {
        volume5.text = String(Int(sender.value))
    }
    
    @IBAction func sendProg1(_ sender: Any) {
        let ch: Int? = Int(ch1.text!)
        let prg: Int? = Int(prg1.text!)
        let volume: Int? = Int(volume1.text!)
        MIDIManager.shared.sendProgramChange(channel: ch ?? 0, program: prg ?? 0 )
        MIDIManager.shared.sendControlChangeVolume(channel: ch ?? 0, value: volume ?? 0 )
    }
    
    @IBAction func sendProg2(_ sender: Any) {
        let ch: Int? = Int(ch2.text!)
        let prg: Int? = Int(prg2.text!)
        let volume: Int? = Int(volume2.text!)
        MIDIManager.shared.sendProgramChange(channel: ch ?? 0, program: prg ?? 0 )
        MIDIManager.shared.sendControlChangeVolume(channel: ch ?? 0, value: volume ?? 0 )
    }
    
    @IBAction func sendProg3(_ sender: Any) {
        let ch: Int? = Int(ch3.text!)
        let prg: Int? = Int(prg3.text!)
        let volume: Int? = Int(volume3.text!)
        MIDIManager.shared.sendProgramChange(channel: ch ?? 0, program: prg ?? 0 )
        MIDIManager.shared.sendControlChangeVolume(channel: ch ?? 0, value: volume ?? 0 )
    }
    
    @IBAction func sendProg4(_ sender: Any) {
        let ch: Int? = Int(ch4.text!)
        let prg: Int? = Int(prg4.text!)
        let volume: Int? = Int(volume4.text!)
        MIDIManager.shared.sendProgramChange(channel: ch ?? 0, program: prg ?? 0 )
        MIDIManager.shared.sendControlChangeVolume(channel: ch ?? 0, value: volume ?? 0 )
    }
    
    @IBAction func sendProg5(_ sender: Any) {
        let ch: Int? = Int(ch5.text!)
        let prg: Int? = Int(prg5.text!)
        let volume: Int? = Int(volume5.text!)
        MIDIManager.shared.sendProgramChange(channel: ch ?? 0, program: prg ?? 0 )
        MIDIManager.shared.sendControlChangeVolume(channel: ch ?? 0, value: volume ?? 0 )
    }
    
    @IBAction func savePressed(_ sender: Any) {
        DBManager.shared.writeInfoset(titolo: titoloConcerto, song: titoloSong, chCollection: chCollection, prgCollection: prgCollection, volumeCollection: volumeCollection)
        //addDataFirebase()
        if let delegate = self.delegate {
         delegate.changeValue(value: indexConcerto)
         }
        transitionToHome()
    }
    
    func queryFirebase () {
        DBManager.shared.getInfosetBySong(song: self.song!) { (infosets) in
            for infoset in infosets {   
                self.firebaseData.append(infoset)
            }
            self.refreshView()
        }
    }
    
    func transitionToHome(){
        let homeViewController = self.storyboard?.instantiateViewController(identifier: "mainVC")
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
  
        
        
    }
    
    func refreshView(){
        for element in firebaseData{
            let index = element.index
            if (index == "1") {
                ch1.text = element.ch
                prg1.text = element.prg
                slider1.value = Float(element.volume) ?? 0
                volume1.text = element.volume
            }
            if (index == "2") {
                ch2.text = element.ch
                prg2.text = element.prg
                slider2.value = Float(element.volume) ?? 0
                volume2.text = element.volume
            }
            if (index == "3") {
                ch3.text = element.ch
                prg3.text = element.prg
                slider3.value = Float(element.volume) ?? 0
                volume3.text = element.volume
            }
            if (index == "4") {
                ch4.text = element.ch
                prg4.text = element.prg
                slider4.value = Float(element.volume) ?? 0
                volume4.text = element.volume
            }
            if (index == "5") {
                ch5.text = element.ch
                prg5.text = element.prg
                slider5.value = Float(element.volume) ?? 0
                volume5.text = element.volume
            }
        }
    }
    
//    func addDataFirebase(){
//            
//            if let uid = Auth.auth().currentUser?.uid {
//                   let campo = self.db.collection("users").document(uid)
//                
//                campo.collection("concerti").document(titoloConcerto).collection("canzoni").document(titoloSong).setData(["nome" : titoloSong])
//                
//                for n in 0...4 {
//                campo.collection("concerti").document(titoloConcerto).collection("canzoni").document(titoloSong).collection("infoset").document(String(n+1)).setData([
//                    "ch": chCollection[n].text ?? "",
//                    "prg": prgCollection[n].text ?? "",
//                    "volume": volumeCollection[n].text ?? "",
//                ])
//                }
//         
//
//    }
//    }
    
  
 }
