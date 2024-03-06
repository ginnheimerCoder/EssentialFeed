//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by David Gänshirt on 06.03.24.
//

import XCTest
import EssentialFeed

protocol FeedImageView {
    associatedtype Image
    
    func display(_ model: FeedImageViewModel<Image>)
}

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

final class FeedImagePresenter<View: FeedImageView, Image> where View.Image == Image {
    
    let view: View
    private let imageTransformer: (Data) -> Image?
    
    internal init(view: View, imageTransformer: @escaping (Data) -> Image?) {
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
        let image = imageTransformer(data)
        view.display(
            FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: image,
                isLoading: false,
                shouldRetry: image == nil
            )
        )
    }
    
    func didFinishLoadingImageData(with error: Error, for model: FeedImage) {
        view.display(
            FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: nil,
                isLoading: false,
                shouldRetry: true
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
        
        sut.didFinishLoadingImageData(with: Data(), for: feedImage)
        
        XCTAssertEqual(view.messages.count, 1)
        XCTAssertEqual(view.messages.first!.location, feedImage.location)
        XCTAssertEqual(view.messages.first!.description, feedImage.description)
        XCTAssertFalse(view.messages.first!.isLoading)
        XCTAssertNil(view.messages.first!.image)
        XCTAssertTrue(view.messages.first!.shouldRetry)
    }
    
    func test_didFinishLoadingImageData_displaysImageOnSuccessfulTransformation() {
        let transformedData = AnyImage()
        let (sut, view) = makeSUT(imageTransformer: { _ in transformedData })
        let feedImage = uniqueImage()
        
        sut.didFinishLoadingImageData(with: Data(), for: feedImage)
        
        XCTAssertEqual(view.messages.count, 1)
        XCTAssertEqual(view.messages.first!.location, feedImage.location)
        XCTAssertEqual(view.messages.first!.description, feedImage.description)
        XCTAssertFalse(view.messages.first!.isLoading)
        XCTAssertEqual(view.messages.first!.image, transformedData)
        XCTAssertFalse(view.messages.first!.shouldRetry)
    }
    
    func test_didFinishLoadingImageDataWithError_displaysRetry() {
        let (sut, view) = makeSUT()
        let feedImage = uniqueImage()
        
        sut.didFinishLoadingImageData(with: anyNSError(), for: feedImage)
        
        XCTAssertEqual(view.messages.count, 1)
        XCTAssertEqual(view.messages.first!.location, feedImage.location)
        XCTAssertEqual(view.messages.first!.description, feedImage.description)
        XCTAssertFalse(view.messages.first!.isLoading)
        XCTAssertNil(view.messages.first!.image)
        XCTAssertTrue(view.messages.first!.shouldRetry)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(imageTransformer: @escaping (Data) -> AnyImage? = { _ in nil }, file: StaticString = #filePath, line: UInt = #line) -> (sut: FeedImagePresenter<ViewSpy, AnyImage>, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedImagePresenter(view: view, imageTransformer: imageTransformer)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private var fail: (Data) -> AnyImage? {
        return { _ in nil }
    }
    
    private struct AnyImage: Equatable {}
    
    private class ViewSpy: FeedImageView {
        
        private(set) var messages = [FeedImageViewModel<AnyImage>]()
        
        func display(_ model: FeedImageViewModel<AnyImage>) {
            messages.append(model)
        }
    }
    
}