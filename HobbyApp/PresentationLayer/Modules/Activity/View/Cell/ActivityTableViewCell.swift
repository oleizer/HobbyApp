//
//  ActivityTableViewCell.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 10.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit
class ActivityTableViewCell: UITableViewCell {
    var url: URL? {
        didSet {
            photoImageView.pin_setImage(from: url)
        }
    }
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var organizationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
