//
//  cellVC.swift
//  hwTableView
//
//  Created by kiran on 8/20/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class cellVC: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
