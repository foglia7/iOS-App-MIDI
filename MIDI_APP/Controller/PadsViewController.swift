//
//  PadsViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 19/08/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import CoreMIDI

class PadsViewController: UIViewController {
    
    var colorEnabled = UIColor.systemGreen
    var octave = 4
    var note = [0]
    
    
    @IBOutlet weak var pad1: UIButton!
    @IBOutlet weak var pad2: UIButton!
    @IBOutlet weak var pad3: UIButton!
    @IBOutlet weak var pad4: UIButton!
    @IBOutlet weak var pad5: UIButton!
    @IBOutlet weak var pad6: UIButton!
    @IBOutlet weak var pad7: UIButton!
    @IBOutlet weak var pad8: UIButton!
    @IBOutlet weak var pad9: UIButton!
    @IBOutlet weak var pad10: UIButton!
    @IBOutlet weak var pad11: UIButton!
    @IBOutlet weak var pad12: UIButton!
    @IBOutlet weak var pad13: UIButton!
    @IBOutlet weak var pad14: UIButton!
    @IBOutlet weak var pad15: UIButton!
    @IBOutlet weak var pad16: UIButton!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
            {
            case 0:
               octave = 0
            case 1:
                octave = 1
            case 2:
                octave = 2
            case 3:
                octave = 3
            case 4:
               octave = 4
            case 5:
                octave = 5
            case 6:
                octave = 6
            case 7:
                octave = 7
            case 8:
               octave = 8
            case 9:
                octave = 9
            case 10:
                octave = 10
            case 11:
                octave = 11
            case 12:
               octave = 12
            case 13:
                octave = 13
            case 14:
                octave = 14
            case 15:
                octave = 15
            case 16:
                octave = 16
            default:
                break
            }
       updateOctave()
    }
    
    
    
    @IBAction func pressPad1(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[0])
        MIDIManager.shared.sendNoteMidi(notevalue: note[0])
        pad1.backgroundColor = colorEnabled
    }
    @IBAction func releasePad1(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[0])
        pad1.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad2(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[1])
        MIDIManager.shared.sendNoteMidi(notevalue: note[1])
        pad2.backgroundColor = colorEnabled
    }
    @IBAction func releasePad2(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[1])
        pad2.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad3(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[2])
        MIDIManager.shared.sendNoteMidi(notevalue: note[2])
        pad3.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad3(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[2])
        pad3.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad4(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[3])
        MIDIManager.shared.sendNoteMidi(notevalue: note[3])
        pad4.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad4(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[3])
        pad4.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad5(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[4])
        MIDIManager.shared.sendNoteMidi(notevalue: note[4])
        pad5.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad5(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[4])
        pad5.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad6(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[5])
        MIDIManager.shared.sendNoteMidi(notevalue: note[5])
        pad6.backgroundColor = colorEnabled
}
    
    @IBAction func releasePad6(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[5])
        pad6.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad7(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[6])
        MIDIManager.shared.sendNoteMidi(notevalue: note[6])
        pad7.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad7(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[6])
        pad7.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad8(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[7])
        MIDIManager.shared.sendNoteMidi(notevalue: note[7])
        pad8.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad8(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[7])
        pad8.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad9(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[8])
        MIDIManager.shared.sendNoteMidi(notevalue: note[8])
        pad9.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad9(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[8])
        pad9.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad10(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[9])
        MIDIManager.shared.sendNoteMidi(notevalue: note[9])
        pad10.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad10(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[9])
        pad10.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad11(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[10])
        MIDIManager.shared.sendNoteMidi(notevalue: note[10])
        pad11.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad11(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[10])
        pad11.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad12(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[11])
        MIDIManager.shared.sendNoteMidi(notevalue: note[11])
        pad12.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad12(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[11])
        pad12.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad13(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[12])
        MIDIManager.shared.sendNoteMidi(notevalue: note[12])
        pad13.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad13(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[12])
        pad13.backgroundColor = UIColor.systemBlue
    }
    
    
    @IBAction func pressPad14(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[13])
        MIDIManager.shared.sendNoteMidi(notevalue: note[13])
        pad14.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad14(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[13])
        pad14.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad15(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[14])
        MIDIManager.shared.sendNoteMidi(notevalue: note[14])
        pad15.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad15(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[14])
        pad15.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func pressPad16(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[15])
        MIDIManager.shared.sendNoteMidi(notevalue: note[15])
        pad16.backgroundColor = colorEnabled
    }
    
    @IBAction func releasePad16(_ sender: Any) {
        MIDIManager.shared.stopNoteMidi(notevalue: note[15])
        pad16.backgroundColor = UIColor.systemBlue
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let octave_base:Int = octave * 12
        note = [octave_base,octave_base + 1,octave_base + 2,octave_base + 3,octave_base + 4,octave_base + 5,octave_base + 6,octave_base + 7,octave_base + 8,octave_base + 9,octave_base + 10,octave_base + 11,octave_base + 12,octave_base + 13,octave_base + 14,octave_base + 15]
        let session = MIDINetworkSession.default()
        session.isEnabled =  true
        let host = MIDINetworkHost.init(name: "iMac di Mhscio", address: "192.168.1.237" , port: 5004)
        let sessions = MIDINetworkConnection.init(host: host)
               print(sessions.self)
              session.addConnection(sessions)
        let contacts = session.contacts()
        for host in contacts {
            session.addContact(host)
            print(MIDINetworkConnection.init(host: host))
        // Do any additional setup after loading the view.
        }}
    
    func updateOctave(){
        let octave_base:Int = octave * 12
        note = [octave_base,octave_base + 1,octave_base + 2,octave_base + 3,octave_base + 4,octave_base + 5,octave_base + 6,octave_base + 7,octave_base + 8,octave_base + 9,octave_base + 10,octave_base + 11,octave_base + 12,octave_base + 13,octave_base + 14,octave_base + 15]
    }
    
        
}
