//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 29.08.23.
//  Test

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
