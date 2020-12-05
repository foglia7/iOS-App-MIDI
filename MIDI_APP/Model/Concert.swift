//
//  SetList.swift
//  MIDI_APP
//
//  Created by Mhscio on 01/04/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import Foundation
import RealmSwift

class Concert: Object {
    @objc dynamic var nome: String? = nil
    let songs = List<Song>()
    @objc dynamic var owner: User?
}
