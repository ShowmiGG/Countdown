//
//  imageCell.swift
//  Simple Countdown
//
//  Created by Shumeng Guo on 21/12/2017.
//  Copyright © 2017 Shumeng Guo. All rights reserved.
//

import UIKit

class imageCell: UITableViewCell {
    
    
    @IBOutlet weak var parallaxImage: UIImageView!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var parallaxHeightConstaint: NSLayoutConstraint!
    @IBOutlet weak var parallaxTopConstaint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parallaxImage.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
    func configureCell(number: String, eventName: String, image: UIImage) {
        self.number.text = number
        self.days.text = "Days"
        self.parallaxImage.image = image
        self.eventName.text = eventName
    }

}
