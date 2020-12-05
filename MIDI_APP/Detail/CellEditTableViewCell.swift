//
//  CellEditTableViewCell.swift
//  MIDI_APP
//
//  Created by Mhscio on 21/08/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit


class CellEditTableViewCell: UITableViewCell {
    
    @IBOutlet var btnEdit: UIButton!

    //2. create delegate variable
    weak var delegate: MyCellDelegate?

    //3. assign this action to close button
    @IBAction func btnEditTapped(sender: AnyObject) {
        //4. call delegate method
        //check delegate is not nil with `?`
        delegate?.btnEditTapped(cell: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

