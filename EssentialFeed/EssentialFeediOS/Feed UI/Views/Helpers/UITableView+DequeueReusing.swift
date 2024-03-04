//
//  UITableView+DequeueReusing.swift
//  EssentialFeediOS
//
//  Created by David Gänshirt on 22.02.24.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
