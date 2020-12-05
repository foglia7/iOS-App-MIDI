//
//  LogInViewController.swift
//  MIDI_APP
//
//  Created by Mhscio on 04/04/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreMIDI
import AudioToolbox
import AVFoundation


class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("console not work ")

        let session = MIDINetworkSession.default()
        session.isEnabled =  true
        print("\(session.networkPort) + questo è il numero della porta ")
        print("\(session.isEnabled) + questo mi dice se è enabled ")
        print("\(session.networkName) + questo mi dice se è enabled ")
        print("\(session.localName) + questo mi dice se è loaclname ")
        print("\(session.sourceEndpoint()) + questo mi dice se sourceendpoint ")
        print("\(session.destinationEndpoint()) + questo mi dice destinationendpoint ")
        print("\(session.contacts()) + questo mi dice cdontacts ")
        print("\(session.connections()) + questo mi dice connections ")
        let host = MIDINetworkHost.init(name: "iMac di Mhscio", address: "192.168.1.237" , port: 5004)
        let sessions = MIDINetworkConnection.init(host: host)
               print(sessions.self)
              session.addConnection(sessions)
        let contacts = session.contacts()
        for host in contacts {
            session.addContact(host)
            print(MIDINetworkConnection.init(host: host))
        }
        
        //print(session.addContact(session.contacts().first!))
        
        
       
        
        /*
        let host = MIDINetworkHost.init(name: "iMac di Mhscio", address: "192.168.1.237" , port: 5004)
       
        
      
        
        let numDevices = MIDIGetNumberOfDevices()
                   for ix in 1...numDevices {
                   let dev = MIDIGetDevice(ix) // `dev` is a MIDIDeviceRef
                   print("Device \(ix) is \(dev)") // so it shows up as a number here
                   var deviceNameCF: Unmanaged<CFString>? // the Swift equivalent of a pointer to a string
                   let propertyNameErr = MIDIObjectGetStringProperty(dev, kMIDIPropertyName, &deviceNameCF)
                   if (propertyNameErr != 0) {
                   print("Error getting property: \(propertyNameErr)")
                   } else {
                   let deviceName = deviceNameCF!.takeRetainedValue()
                       print("Device name: \(deviceName)")
                   }
                   }
        
        */
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email , password: password) { (result, error) in
            if error != nil {
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                if let uid = Auth.auth().currentUser?.uid {
                    DBManager.shared.storeCurrentUser(uid: uid)
                }
                self.transitionToHome()
            }
        }
    }
    
    func transitionToHome(){
        let homeViewController = self.storyboard?.instantiateViewController(identifier: "mainVC")
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
        
    }
    
    @IBAction func sendMIDItest(_ sender: Any) {
        print("queste sono le destinationn \(MIDIGetDestination(0))")
        var midiClient: MIDIClientRef = 0
        var outPort:MIDIPortRef = 0
        MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
        MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)

        var packet1:MIDIPacket = MIDIPacket()
        packet1.timeStamp = 0
        packet1.length = 2
        packet1.data.0 = 0xC1
        packet1.data.1 = 0x10
        print(packet1)
        var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)
        let dest:MIDIEndpointRef = MIDIGetDestination(0);
        print("questa è la destination \(MIDIGetDestination(0))")
       MIDISend(outPort, dest, &packetList)
        print(MIDISend(outPort, dest, &packetList))
        
        var packet2:MIDIPacket = MIDIPacket()
        packet2.timeStamp = 0
        packet2.length = 2
        packet2.data.0 = 0xC1
        packet2.data.1 = 0x10
        print(packet2)
        var packetList2:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet2)
        MIDISend(outPort, dest, &packetList2)
        print(MIDISend(outPort, dest, &packetList2))
        
    }
    
    func midisend(status:Int, note: Int, value:Int) {
/*
        var packet:UnsafeMutablePointer<MIDIPacket>
        var packetList:UnsafeMutablePointer<MIDIPacketList>
        let midiDataToSend:[UInt8] = [status,note,value];
           packet = MIDIPacketListInit(packetList);
           packet = MIDIPacketListAdd(packetList, 1024, packet, 0, 3, midiDataToSend);

           if (packet == nil ) {
               print("failed to send the midi.")
           } else {
               MIDIReceived(MIDIGetDestination(0), packetList)
               print("sent some stuff")
           }*/
          // packet.destroy()
           //packet.dealloc(1)
          // packetList.destroy()
          // packetList.dealloc(1)
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
