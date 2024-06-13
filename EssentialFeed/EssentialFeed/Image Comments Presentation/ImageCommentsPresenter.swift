//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 13.06.24.
//

import Foundation

public struct ImageCommentsViewModel {
    public let comments: [ImageCommentViewModel]
}

public struct ImageCommentViewModel: Equatable {
    public let message: String
    public let date: String
    public let username: String
    
    public init(message: String, date: String, username: String) {
        self.message = message
        self.date = date
        self.username = username
    }
}

public final class ImageCommentsPresenter {
    
    public static var title: String {
        NSLocalizedString(
            "IMAGE_COMMENTS_VIEW_TITLE",
            tableName: "ImageComments",
            bundle: Bundle(for: Self.self),
            comment: "title for the image comments view"
        )
    }
    
    public static func map(
        _ comments: [ImageComment],
        currentDate: Date = Date(),
        calendar: Calendar = .current,
        locale: Locale = .current
    ) -> ImageCommentsViewModel {
        let formatter = RelativeDateTimeFormatter()
        formatter.calendar = calendar
        formatter.locale = locale
        
        return ImageCommentsViewModel(comments: comments.map { comment in
            ImageCommentViewModel(
                message: comment.message,
                date: formatter.localizedString(for: comment.createdAt, relativeTo: currentDate),
                username: comment.username)
            
        })
    }
    

}