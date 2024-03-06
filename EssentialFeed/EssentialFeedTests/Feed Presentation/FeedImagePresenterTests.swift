//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by David Gänshirt on 06.03.24.
//

import XCTest

final class FeedImagePresenter {
    
    init() {
        
    }
    
}

final class FeedImagePresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedImagePresenter()
        
        XCTAssertTrue(view.messages.isEmpty, "Exprected no view messages")
    }
    
    // MARK: - Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
    
}
