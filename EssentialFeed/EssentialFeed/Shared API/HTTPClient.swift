//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 01.09.23.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    /// The completion handler can be invokes in any thread.
    /// Clients are responsible to dispatch to appropriate thread, if needed.
    @discardableResult
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
