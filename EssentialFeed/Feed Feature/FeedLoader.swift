//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 25.08.23.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
