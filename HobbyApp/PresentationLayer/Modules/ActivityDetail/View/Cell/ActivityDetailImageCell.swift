//
//  ActivityDetailImageCell.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 11.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit

class ActivityDetailImageCell: UITableViewCell {
    @IBOutlet private weak var photoImageView: UIImageView!
    var url: URL? {
        didSet {
            photoImageView.pin_setImage(from: url)
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
