//
//  RoomsTableViewCell.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 13/04/22.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var roomIDLabel: UILabel!
    @IBOutlet weak var roomOccupancyLabel: UILabel!
    @IBOutlet weak var roomOccupiedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func updateCellUI(room: Rooms) {
        roomIDLabel.text = "Room no: \(room.id)"
        roomOccupancyLabel.text = "Max Occupancy: \(room.maxOccupancy)"
        roomOccupiedLabel.text =  room.isOccupied ? "Occupied" : "Not Occupied"
        roomOccupiedLabel.textColor = room.isOccupied ? .red : .green
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
