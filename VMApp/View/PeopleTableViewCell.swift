//
//  PeopleTableViewCell.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 13/04/22.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userFirstName: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func updateCellUI(people: People) {
        self.setImageFromUrl(imageUrl: people.avatar)
        userFirstName.text = people.firstName
        userLastName.text = people.lastName
        userTitle.text = people.jobTitle
        userEmail.text = people.email
    }
    
    public func setImageFromUrl(imageUrl: String) {
        self.setDefaultImage()
        if imageUrl != "" {
            NetworkServices().downloadImageFrom(urlString: imageUrl) { imageData in
                if let data = imageData {
                    DispatchQueue.main.async {
                        if let img = UIImage(data: data) {
                            self.userImage.image = img
                        }
                    }
                } else {
                    self.setDefaultImage()
                    print("Failed downloading image for url: \(imageUrl)")
                }
            }
        } else {
            setDefaultImage()
        }
    }
    
    public func setDefaultImage() {
        DispatchQueue.main.async {
            self.userImage.image = nil
            self.userImage.image = UIImage(named: "userImage")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
