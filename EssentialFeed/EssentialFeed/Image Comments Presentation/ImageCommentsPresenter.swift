//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by David Gänshirt on 13.06.24.
//

import Foundation

public final class ImageCommentsPresenter {
    
    public static var title: String {
        NSLocalizedString(
            "IMAGE_COMMENTS_VIEW_TITLE",
            tableName: "ImageComments",
            bundle: Bundle(for: Self.self),
            comment: "title for the image comments view"
        )
    }

}
