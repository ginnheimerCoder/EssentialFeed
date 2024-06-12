//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by David Gänshirt on 12.06.24.
//

import XCTest
import EssentialFeed

final class SharedLocalizationTests: XCTestCase {
    
    func test_localizedString_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }

}
