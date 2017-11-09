//
//  UITableViewExtensions.swift
//  HobbyApp
//
//  Created by Олег Лейзер on 09.11.2017.
//  Copyright © 2017 Олег Лейзер. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let Nib = UINib(nibName: T.NibName, bundle: nil)
        register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: CellViewModel>(withModel model: T, for indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: T.CellType.self)
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let cell = cell as? T.CellType {
            model.setup(cell: cell)
        }else{
            assertionFailure("Error: cell model")
        }
        return cell
    }

}
extension UITableViewCell: ReusableView, NibLoadableView { }

protocol ReusableView: class {}
extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
protocol NibLoadableView: class {}
extension NibLoadableView where Self: UIView {
    static var NibName: String {
        return String(describing: self)
    }
}
