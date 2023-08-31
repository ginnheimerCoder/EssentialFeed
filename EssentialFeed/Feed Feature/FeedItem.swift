//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 25.08.23.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
