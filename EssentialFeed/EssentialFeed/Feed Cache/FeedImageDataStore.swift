//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 12.03.24.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    func retrieveData(forUrl url: URL, completion: @escaping (Result) -> Void)
}
