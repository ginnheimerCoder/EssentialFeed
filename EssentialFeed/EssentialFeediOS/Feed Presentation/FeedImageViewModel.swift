//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by David Gänshirt on 12.02.24.
//

import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
