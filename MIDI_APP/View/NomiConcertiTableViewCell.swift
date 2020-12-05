//
//  NomiConcertiTableViewCell.swift
//  MIDI_APP
//
//  Created by Mhscio on 01/04/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit

class NomiConcertiTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeConcerto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
