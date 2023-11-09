//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 25.08.23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
