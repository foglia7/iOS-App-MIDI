//
//  Configuration.swift
//  MIDI_APP
//
//  Created by Mhscio on 29/08/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import Foundation
import RealmSwift

class Infoset: Object {
    @objc dynamic var index = ""
    @objc dynamic var ch = ""
    @objc dynamic var prg = ""
    @objc dynamic var volume = ""
    @objc dynamic var song: Song?
}
