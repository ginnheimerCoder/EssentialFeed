//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by David Gänshirt on 06.11.23.
//

import XCTest

class LocalFeedLoader {
    
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class TestFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
    
}
