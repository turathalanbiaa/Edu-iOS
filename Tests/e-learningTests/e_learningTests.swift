import XCTest
@testable import e_learning

final class e_learningTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(e_learning().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
