//
//  MIDIManager.swift
//  MIDI_APP
//
//  Created by Mhscio on 28/11/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import Foundation
import CoreMIDI

class MIDIManager {
    
    static let shared = MIDIManager()
    
    init(){}
    
    func setUpMIDIConnection() {
        
        let session = MIDINetworkSession.default()
        session.isEnabled =  true
//        let host = MIDINetworkHost.init(name: "iMac di Mhscio", address: "192.168.1.237" , port: 5004)
//        let sessions = MIDINetworkConnection.init(host: host)
//               print(sessions.self)
//              session.addConnection(sessions)
        let contacts = session.contacts()
        for host in contacts {
            session.addContact(host)
            print(MIDINetworkConnection.init(host: host))
        }
    }
    
    func sendControlChangeVolume(channel:Int , value:Int){
        print("queste sono le destinationn \(MIDIGetDestination(0))")
        var midiClient: MIDIClientRef = 0
        var outPort:MIDIPortRef = 0
        MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
        MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)
        var packet1:MIDIPacket = MIDIPacket()
        packet1.timeStamp = 0
        packet1.length = 3
        packet1.data.0 = UInt8(175 + channel)
        packet1.data.1 = UInt8(7)
        packet1.data.2 = UInt8(value)
        print(packet1)
        var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)
        let dest:MIDIEndpointRef = MIDIGetDestination(0);
        print("questa è la destination \(MIDIGetDestination(0))")
        MIDISend(outPort, dest, &packetList)
        print(MIDISend(outPort, dest, &packetList))
    }
    
    func sendNoteMidi(notevalue:Int){
            print("queste sono le destinationn \(MIDIGetDestination(0))")
            var midiClient: MIDIClientRef = 0
            var outPort:MIDIPortRef = 0
            MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
            MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)

            var packet1:MIDIPacket = MIDIPacket()
            
            packet1.timeStamp = 0
            packet1.length = 3
            packet1.data.0 = 0x90
            packet1.data.1 = UInt8(notevalue)
            packet1.data.2 = 100
            print(packet1)
            var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)

            let dest:MIDIEndpointRef = MIDIGetDestination(0);
            print("questa è la destination \(MIDIGetDestination(0))")
            MIDISend(outPort, dest, &packetList)
            //MIDI1UPNoteOn(0, 1, 65, 120);
            //print(MIDI1UPNoteOn(0, 1, 65, 120));
            print(MIDISend(outPort, dest, &packetList))
        }
    
    func stopNoteMidi(notevalue:Int){
            print("queste sono le destinationn \(MIDIGetDestination(0))")
            var midiClient: MIDIClientRef = 0
            var outPort:MIDIPortRef = 0
            MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
            MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)

            var packet1:MIDIPacket = MIDIPacket()
            
            packet1.timeStamp = 0
            packet1.length = 3
            packet1.data.0 = 0x80
            packet1.data.1 = UInt8(notevalue)
            packet1.data.2 = 0
            print(packet1)
            var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)

            let dest:MIDIEndpointRef = MIDIGetDestination(0);
            print("questa è la destination \(MIDIGetDestination(0))")
            MIDISend(outPort, dest, &packetList)
            print(MIDISend(outPort, dest, &packetList))
        }
    
    func sendProgramChange(channel:Int , program:Int){
        print("queste sono le destinationn \(MIDIGetDestination(0))")
        var midiClient: MIDIClientRef = 0
        var outPort:MIDIPortRef = 0
        MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
        MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)
        var packet1:MIDIPacket = MIDIPacket()
        packet1.timeStamp = 0
        packet1.length = 2
        packet1.data.0 = UInt8(192 + channel)
        packet1.data.3 = UInt8(program)
        print(packet1)
        var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)
        let dest:MIDIEndpointRef = MIDIGetDestination(0);
        print("questa è la destination \(MIDIGetDestination(0))")
       MIDISend(outPort, dest, &packetList)
        print(MIDISend(outPort, dest, &packetList))
    }
    
    func sendMIDIPitch(value1: Int) {
     if (value1 < 128 && value1 > 0) {
         print("queste sono le destinationn \(MIDIGetDestination(0))")
         var midiClient: MIDIClientRef = 0
         var outPort:MIDIPortRef = 0
         MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
         MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)

         var packet1:MIDIPacket = MIDIPacket()
         packet1.timeStamp = 0
         packet1.length = 3
         packet1.data.0 = 0xE0
         packet1.data.1 = UInt8(127)
         packet1.data.2 = UInt8(value1)
         print(packet1)
         var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)
         let dest:MIDIEndpointRef = MIDIGetDestination(0);
         print("questa è la destination \(MIDIGetDestination(0))")
         MIDISend(outPort, dest, &packetList)
         print(MIDISend(outPort, dest, &packetList))
         
     }
    }
     
     func sendMIDIModulation(value2: Int) {
      if (value2 < 128 && value2 > 0) {
          print("queste sono le destinationn \(MIDIGetDestination(0))")
          var midiClient: MIDIClientRef = 0
          var outPort:MIDIPortRef = 0
          MIDIClientCreate("MidiTestClient" as CFString, nil, nil, &midiClient)
          MIDIOutputPortCreate(midiClient, "MidiTest_OutPort" as CFString, &outPort)

          var packet1:MIDIPacket = MIDIPacket()
          packet1.timeStamp = 0
          packet1.length = 3
          packet1.data.0 = 0xB0
          packet1.data.1 = UInt8(1)
          packet1.data.2 = UInt8(value2)
          print(packet1)
          var packetList:MIDIPacketList = MIDIPacketList(numPackets: 1, packet: packet1)
          let dest:MIDIEndpointRef = MIDIGetDestination(0);
          print("questa è la destination \(MIDIGetDestination(0))")
          MIDISend(outPort, dest, &packetList)
          print(MIDISend(outPort, dest, &packetList))
          
      }
 }
    
    
    
    
}
