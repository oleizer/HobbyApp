//
//  ActivityDetailDescriptionCell.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 11.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit

class ActivityDetailDescriptionCell: UITableViewCell {
    @IBOutlet private weak var descriptionLabel: UILabel!
    var detailText: String? {
        didSet {
            descriptionLabel.text = detailText
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
