//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 10.06.24.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
