//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 01.09.23.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
