//
//  XCTestCase+memoryLeakTracking.swift
//  EssentialAppTests
//
//  Created by David Gänshirt on 15.03.24.
//

import Foundation

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
