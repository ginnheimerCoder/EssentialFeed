//
//  FeedimageDataCache.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 03.04.24.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
