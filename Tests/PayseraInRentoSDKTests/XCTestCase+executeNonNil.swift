import PromiseKit
import XCTest

extension XCTestCase {
    func executeNonNil<T>(
        _ promise: Promise<T>,
        description: String
    ) {
        execute(promise, description: description) { actualResult in
            actualResult != nil
        }
    }
    
    private func execute<T>(
        _ promise: Promise<T>,
        description: String,
        expectedResult: (T?) -> Bool
    ) {
        var actual: T?
        let expectation = XCTestExpectation(description: description)
        promise
            .done { response in
                actual = response
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 20)
        XCTAssertTrue(expectedResult(actual))
    }
}
