//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 09.11.23.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
