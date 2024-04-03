//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 03.04.24.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
