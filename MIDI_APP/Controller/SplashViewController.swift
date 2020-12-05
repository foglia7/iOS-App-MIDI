//
//  SplashViewController.swift
//  MIDI_APP
//
//  Created by Federico Foglietta on 21/10/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import FirebaseAuth
import CoreMIDI
import AudioToolbox
import AVFoundation


class SplashViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            transitionToHome();
        }
    }
    
    func transitionToHome(){
        let homeViewController = self.storyboard?.instantiateViewController(identifier: "mainVC")
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
