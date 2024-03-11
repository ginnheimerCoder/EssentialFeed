//
//  LocalFeedImageDataLoaderTests.swift
//  EssentialFeedTests
//
//  Created by David Gänshirt on 11.03.24.
//

import XCTest

final class LocalFeedImageDataLoader {
    
    init(store: Any) {
        
    }
    
}

final class LocalFeedImageDataLoaderTests: XCTestCase {
    
    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertTrue(store.receivedMessages.isEmpty)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (sut: LocalFeedImageDataLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedImageDataLoader(store: store)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(store, file: file, line: line)
        return(sut, store)
    }
    
    private class FeedStoreSpy {
        let receivedMessages = [Any]()
    }
}
