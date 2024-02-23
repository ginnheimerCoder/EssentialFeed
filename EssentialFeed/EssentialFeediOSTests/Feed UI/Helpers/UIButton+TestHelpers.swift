//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by David Gänshirt on 23.02.24.
//

import Foundation
import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
