//
//  Song.swift
//  MIDI_APP
//
//  Created by Mhscio on 31/03/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import Foundation
import RealmSwift

class Song: Object {
    @objc dynamic var title: String? = nil
    @objc dynamic var concert: Concert?
}
