//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by David Gänshirt on 04.03.24.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
