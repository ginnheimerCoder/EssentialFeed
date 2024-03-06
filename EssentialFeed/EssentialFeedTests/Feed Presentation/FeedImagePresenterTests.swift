//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by David Gänshirt on 06.03.24.
//

import XCTest
import EssentialFeed

protocol FeedImageView {
    func display(_ model: FeedImageViewModel)
}

struct FeedImageViewModel {
    let description: String?
    let location: String?
    let image: Any?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}

final class FeedImagePresenter {
    
    let view: FeedImageView
    private let imageTransformer: (Data) -> Any?
    
    internal init(view: FeedImageView, imageTransformer: @escaping (Data) -> Any?) {
        self.view = view
        self.imageTransformer = imageTransformer
    }
    
    func didStartLoadingImageData(for model: FeedImage) {
        view.display(
            FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: nil,
                isLoading: true,
                shouldRetry: false
            )
        )
    }
    
    func didFinishLoadingImageData(with data: Data, for model: FeedImage) {
        view.display(
            FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: imageTransformer(data),
                isLoading: false,
                shouldRetry: false
            )
        )
    }
    
}

final class FeedImagePresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Exprected no view messages")
    }
    
    func test_didStartLoadingImageData_displaysLoadingImage() {
        let (sut, view) = makeSUT()
        let feedImage = uniqueImage()
        
        sut.didStartLoadingImageData(for: feedImage)
        
        XCTAssertEqual(view.messages.count, 1)
        XCTAssertEqual(view.messages.first!.location, feedImage.location)
        XCTAssertEqual(view.messages.first!.description, feedImage.description)
        XCTAssertTrue(view.messages.first!.isLoading)
        XCTAssertNil(view.messages.first!.image)
        XCTAssertFalse(view.messages.first!.shouldRetry)
    }
    
    func test_didFinishLoadingImageData_displaysRetryOnFailedImageTransformation() {
        let (sut, view) = makeSUT(imageTransformer: fail)
        let feedImage = uniqueImage()
        let data = Data()
        
        sut.didFinishLoadingImageData(with: data, for: feedImage)
        
        XCTAssertEqual(view.messages.count, 1)
        XCTAssertEqual(view.messages.first!.location, feedImage.location)
        XCTAssertEqual(view.messages.first!.description, feedImage.description)
        XCTAssertFalse(view.messages.first!.isLoading)
        XCTAssertNil(view.messages.first!.image)
        XCTAssertFalse(view.messages.first!.shouldRetry)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(imageTransformer: @escaping (Data) -> Any? = { _ in nil }, file: StaticString = #filePath, line: UInt = #line) -> (sut: FeedImagePresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedImagePresenter(view: view, imageTransformer: imageTransformer)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private var fail: (Data) -> Any? {
        return { _ in nil }
    }
    
    private class ViewSpy: FeedImageView {
        
        private(set) var messages = [FeedImageViewModel]()
        
        func display(_ model: FeedImageViewModel) {
            messages.append(model)
        }
    }
    
}
