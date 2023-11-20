//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 07.11.23.
//

import Foundation

public enum RetrievedCachedFeedResult {
    case empty
    case found(feed: [LocalFeedImage], timestamp: Date)
    case failure(Error)
}

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetrievalCompletion = (RetrievedCachedFeedResult) -> Void
    
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
 
