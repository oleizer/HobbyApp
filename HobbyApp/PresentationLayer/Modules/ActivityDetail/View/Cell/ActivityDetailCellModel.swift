//
//  ActivityDetailCellModel.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 11.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import Foundation
// MARK: - ActivityDetailImageCell

struct ActivityDetailImageCellModel {
    let model: Activity
    var url: String {
        return model.picture.url.replacingOccurrences(of: "\\", with: "")
    }
}

extension ActivityDetailImageCellModel: CellViewModel {
    func setup(cell: ActivityDetailImageCell) {
        cell.url = URL(string: url)
    }
}
// MARK: - ActivityDetailDescriptionCell
struct ActivityDetailDescriptionCellModel {
    let model: Activity
    var detail: String {
        return model.detail
    }
}

extension ActivityDetailDescriptionCellModel: CellViewModel {
    func setup(cell: ActivityDetailDescriptionCell) {
        cell.detailText = detail
    }
}
// MARK: - ActivityDetailInfoCell
struct ActivityDetailInfoCellModel {
    let info: String
    let detail: String
}

extension ActivityDetailInfoCellModel: CellViewModel {
    func setup(cell: ActivityDetailInfoCell) {
        cell.infoText = info
        cell.detailText = detail
    }
}
