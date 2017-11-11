//
//  ActivityDetailInfoCell.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 11.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit

class ActivityDetailInfoCell: UITableViewCell {

    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    var detailText: String? {
        didSet {
            detailLabel.text = detailText
        }
    }
    var infoText: String? {
        didSet {
            infoLabel.text = infoText
        }
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
