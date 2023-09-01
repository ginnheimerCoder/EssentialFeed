//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 25.08.23.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
