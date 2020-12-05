//
//  XYPad.swift
//  MIDI_APP
//
//  Created by Mhscio on 05/09/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import CoreMIDI

class XYPad: UIView {
    
    var lineArray: [[CGPoint]] = [[CGPoint]]()


        override func draw(_ rect: CGRect) {
            let context = UIGraphicsGetCurrentContext()
            context?.setLineWidth(10)
            context?.setLineCap(.round)
            context?.setStrokeColor(UIColor.blue.cgColor)
            context?.setBlendMode(CGBlendMode.normal)
            for line in lineArray {
                guard let firstPoint = line.first else { continue }
                context?.beginPath()
                context?.move(to: firstPoint)
                for point in line.dropFirst() {
                    context?.addLine(to: point)
                }
                context?.strokePath()
            }
            context?.resetClip()
            
        }

    //Define your initialisers here
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
        let currentPoint = touch.location(in: self)
            adaptLocation(location: currentPoint)
            guard let touch = touches.first else { return }
            let firstPoint = touch.location(in: self)
            lineArray.append([CGPoint]())
            lineArray[lineArray.count - 1].append(firstPoint)
            
        
        // do something with your currentPoint
        //print(currentPoint)
      }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
        let currentPoint = touch.location(in: self)
            adaptLocation(location: currentPoint)
           
            
        // do something with your currentPoint
        //print(currentPoint)
            guard let touch = touches.first else { return }
            lineArray[lineArray.count - 1].append(currentPoint)
            setNeedsDisplay()
       
      }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            adaptLocation(location: currentPoint)
            MIDIManager.shared.sendMIDIModulation(value2: 64)
            MIDIManager.shared.sendMIDIPitch(value1: 64)
          lineArray = []
        // do something with your currentPoint
        //print(currentPoint)
      }
    }
    
    func adaptLocation(location: CGPoint) {
        let locationx = Int(((location.x)*128)/640)
        let locationy = Int(((location.y)*128)/640)
        let locationxpitch = Int(((location.x)*16383)/640)
        print(locationxpitch)
        //data[0] = (byte) (locationxpitch & 0xFF);
        //data[1] = (byte) ((locationxpitch >> 8) & 0xFF);
        let a = UInt8(locationxpitch >> 8 & 0x00ff)
        let b = UInt8(locationxpitch & 0x00ff)
        print("\(a),\(b)")
        MIDIManager.shared.sendMIDIPitch(value1: locationx)
        MIDIManager.shared.sendMIDIModulation(value2: locationy)
    }
    
    func returnIntRgb(location: CGPoint) -> Int {
        let locationx = Int(((location.x - 320)*255)/320)
        print("\(locationx)")
        return locationx
    }
    
 

}
