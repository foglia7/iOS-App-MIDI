//
//  SongTableViewCell.swift
//  MIDI_APP
//
//  Created by Mhscio on 30/03/2020.
//  Copyright © 2020 Mhscio. All rights reserved.
//

import UIKit
import Firebase
import CoreMIDI

protocol SongTableViewCellDelegate: AnyObject {
    func btnEditTapped(with song: Song)
}

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var nometextView: UITextField!
    @IBOutlet weak var numeroSongLabel: UILabel!
    @IBOutlet weak var nomeSongLabel: UILabel!
    @IBOutlet weak var ButtonUno: UIButton!
    @IBOutlet weak var ButtonDue: UIButton!
    @IBOutlet weak var ButtonTre: UIButton!
    @IBOutlet weak var ButtonQuattro: UIButton!
    @IBOutlet weak var ButtonCinque: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet weak var nomeSong: UILabel!
    
    var titoloConcerto: String = ""
    var song: Song?
    
    //2. create delegate variable
    weak var delegate:SongTableViewCellDelegate?
    var listConfiguration:[Infoset] = []

    
    

    
    @IBAction func buttonPressed(sender:AnyObject){
        delegate?.btnEditTapped(with: song!)
        }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //queryFirebase()
        
    }
    
    override func layoutSubviews() {
        queryFirebase()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }



    @IBAction func pressButton1(_ sender: Any) {
        functionNumeredButton(index: 1)
    }
    
    @IBAction func pressButton2(_ sender: Any) {
        functionNumeredButton(index: 2)
    }
    
    @IBAction func pressButton3(_ sender: Any) {
        functionNumeredButton(index: 3)
    }
    
    @IBAction func pressButton4(_ sender: Any) {
        functionNumeredButton(index: 4)
    }
    
    @IBAction func pressButton5(_ sender: Any) {
        functionNumeredButton(index: 5)
    }
    
    
    
    func queryFirebase () {
        print("questo è il nome della song : \(nomeSong.text!)")
        DBManager.shared.getInfosetBySong(song: self.song!) { (infosets) in
            for infoset in infosets {
                self.listConfiguration.append(infoset)
            }
        }
    }
    
    
    func functionNumeredButton(index: Int) {
        let ch = Int(listConfiguration[index - 1 ].ch)
        let prg = Int(listConfiguration[index - 1 ].prg)
        MIDIManager.shared.sendProgramChange(channel: ch ?? 0, program: prg ?? 0 )
    }

}
