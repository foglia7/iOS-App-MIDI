//
//  User.swift
//  MIDI_APP
//
//  Created by Mhscio on 21/10/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var uid: String? = nil
    @objc dynamic var firstName: String? = nil
    @objc dynamic var lastName: String? = nil
    @objc dynamic var email: String? = nil
}
