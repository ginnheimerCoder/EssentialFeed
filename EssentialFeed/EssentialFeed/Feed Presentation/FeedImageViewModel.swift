//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 06.03.24.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
