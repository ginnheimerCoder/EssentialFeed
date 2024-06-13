//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 06.03.24.
//

import Foundation

public final class FeedImagePresenter {
    
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location
        )
    }
    
}
