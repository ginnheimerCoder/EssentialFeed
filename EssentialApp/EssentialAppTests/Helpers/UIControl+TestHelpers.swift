//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by David Gänshirt on 23.02.24.
//

import Foundation
import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
