//
//  FeedImageDataStoreSpy.swift
//  EssentialFeedTests
//
//  Created by David Gänshirt on 12.03.24.
//

import Foundation
import EssentialFeed

class FeedImageDataStoreSpy: FeedImageDataStore {
    
    enum Message: Equatable {
        case retrieveData(forUrl: URL)
        case insert(_ data: Data, for: URL)
    }
    
    private(set) var insertionCompletions = [(FeedImageDataStore.InsertionResult) -> Void]()
    private(set) var retrievalCompletions = [(FeedImageDataStore.RetrievalResult) -> Void]()
    private(set) var receivedMessages = [Message]()
    
    func retrieve(dataForUrl url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        receivedMessages.append(.retrieveData(forUrl: url))
        retrievalCompletions.append(completion)
    }
    
    func insert(_ data: Data, for url: URL, completion: @escaping (FeedImageDataStore.InsertionResult) -> Void) {
        receivedMessages.append(.insert(data, for: url))
        insertionCompletions.append(completion)
    }
    
    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletions[index](.failure(error))
    }
    
    func completeRetrieval(with data: Data?, at index: Int = 0) {
        retrievalCompletions[index](.success(data))
    }
    
    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](.failure(error))
    }
}
