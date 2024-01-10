//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 07.11.23.
//

import Foundation

public typealias CachedFeed = (feed: [LocalFeedImage], timestamp: Date)

public protocol FeedStore {
    
    typealias DeletionResult = Result<Void, Error>
    typealias DeletionCompletion = (DeletionResult) -> Void
    
    typealias InsertionResult = Result<Void, Error>
    typealias InsertionCompletion = (InsertionResult) -> Void
    
    typealias RetrievalCompletion = (RetrievalResult) -> Void
    typealias RetrievalResult = Result<CachedFeed?, Error>
    
    /// The completion handler can be invoikes in any thread.
    ///  Clients are responsible to dispatch to appropriate thread, if needed.
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    
    /// The completion handler can be invoikes in any thread.
    ///  Clients are responsible to dispatch to appropriate thread, if needed.
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    
    /// The completion handler can be invoikes in any thread.
    ///  Clients are responsible to dispatch to appropriate thread, if needed. 
    func retrieve(completion: @escaping RetrievalCompletion)
}
 
