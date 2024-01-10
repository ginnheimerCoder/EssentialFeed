//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 25.08.23.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
