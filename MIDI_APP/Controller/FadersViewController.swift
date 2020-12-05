//
//  FadersViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 25/11/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import CoreMIDI

class FadersViewController: UIViewController {

    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var slider5: UISlider!
    @IBOutlet weak var slider6: UISlider!
    @IBOutlet weak var slider7: UISlider!
    @IBOutlet weak var slider8: UISlider!
    @IBOutlet weak var slider9: UISlider!
    @IBOutlet weak var slider10: UISlider!
    @IBOutlet weak var slider11: UISlider!
    @IBOutlet weak var slider12: UISlider!
    @IBOutlet weak var slider13: UISlider!
    @IBOutlet weak var slider14: UISlider!
    @IBOutlet weak var slider15: UISlider!
    @IBOutlet weak var slider16: UISlider!
    
    
    @IBOutlet weak var volume1: UITextField!
    @IBOutlet weak var volume2: UITextField!
    @IBOutlet weak var volume3: UITextField!
    @IBOutlet weak var volume4: UITextField!
    @IBOutlet weak var volume5: UITextField!
    @IBOutlet weak var volume6: UITextField!
    @IBOutlet weak var volume7: UITextField!
    @IBOutlet weak var volume8: UITextField!
    @IBOutlet weak var volume9: UITextField!
    @IBOutlet weak var volume10: UITextField!
    @IBOutlet weak var volume11: UITextField!
    @IBOutlet weak var volume12: UITextField!
    @IBOutlet weak var volume13: UITextField!
    @IBOutlet weak var volume14: UITextField!
    @IBOutlet weak var volume15: UITextField!
    @IBOutlet weak var volume16: UITextField!
    
    
    @IBAction func slider1(_ sender: UISlider) {
        volume1.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 1, value: Int(sender.value))
    }
    
    @IBAction func slider2(_ sender: UISlider) {
        volume2.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 2, value: Int(sender.value))
        }
    
    @IBAction func slider3(_ sender: UISlider) {
        volume3.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 3, value: Int(sender.value))
    }
    
    @IBAction func slider4(_ sender: UISlider) {
        volume4.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 4, value: Int(sender.value))
    }
    
    @IBAction func slider5(_ sender: UISlider) {
        volume5.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 5, value: Int(sender.value))
    }
    
    @IBAction func slider6(_ sender: UISlider) {
        volume6.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 6, value: Int(sender.value))
    }
    
    @IBAction func slider7(_ sender: UISlider) {
        volume7.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 7, value: Int(sender.value))
    }
    
    @IBAction func slider8(_ sender: UISlider) {
        volume8.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 8, value: Int(sender.value))
    }
    
    @IBAction func slider9(_ sender: UISlider) {
        volume9.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 9, value: Int(sender.value))
    }
    
    @IBAction func slider10(_ sender: UISlider) {
        volume10.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 10, value: Int(sender.value))
    }
    
    @IBAction func slider11(_ sender: UISlider) {
        volume11.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 11, value: Int(sender.value))
    }
    
    @IBAction func slider12(_ sender: UISlider) {
        volume12.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 12, value: Int(sender.value))
    }
    
    @IBAction func slider13(_ sender: UISlider) {
        volume13.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 13, value: Int(sender.value))
    }
    
    @IBAction func slider14(_ sender: UISlider) {
        volume14.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 14, value: Int(sender.value))
    }
    
    @IBAction func slider15(_ sender: UISlider) {
        volume15.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 15, value: Int(sender.value))
    }
    
    @IBAction func slider16(_ sender: UISlider) {
        volume16.text = String(Int(sender.value))
        MIDIManager.shared.sendControlChangeVolume(channel: 16, value: Int(sender.value))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    func sendControlChangeVolume(channel:Int , value:Int){
//        print("queste sono le destinationn \(MIDIGetDestination(0))")
//        var midiClient: MIDIClientRef = 0
//        var outPort:MIDIPortRef = 0
//        MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
//        MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)
//        var packet1:MIDIPacket = MIDIPacket()
//        packet1.timeStamp = 0
//        packet1.length = 3
//        packet1.data.0 = UInt8(175 + channel)
//        packet1.data.1 = UInt8(7)
//        packet1.data.2 = UInt8(value)
//        print(packet1)
//        var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)
//        let dest:MIDIEndpointRef = MIDIGetDestination(0);
//        print("questa è la destination \(MIDIGetDestination(0))")
//        MIDISend(outPort, dest, &packetList)
//        print(MIDISend(outPort, dest, &packetList))
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
