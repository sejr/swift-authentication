import XCTest

import AuthenticationTests

var tests = [XCTestCaseEntry]()
tests += AuthenticationTests.allTests()
XCTMain(tests)
