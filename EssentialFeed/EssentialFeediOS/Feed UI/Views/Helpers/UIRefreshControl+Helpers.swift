//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by David Gänshirt on 04.03.24.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
