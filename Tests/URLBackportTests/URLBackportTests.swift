@testable import URLBackport
import XCTest

@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *)
final class URLBackportTests: XCTestCase {
  func testInitializeWithDirectoryPath() {
    let path = "/path"
    XCTAssertEqual(
      URL(filePath: path, directoryHint: .isDirectory, relativeTo: nil),
      URL.backport(filePath: path, directoryHint: .isDirectory, relativeTo: nil)
    )
  }

  func testInitializeWithFilePath() {
    let path = "/path"
    XCTAssertEqual(
      URL(filePath: path, directoryHint: .notDirectory, relativeTo: nil),
      URL.backport(filePath: path, directoryHint: .notDirectory, relativeTo: nil)
    )
  }

  func testInitializeWithExistingFilePath() {
    let path = NSHomeDirectory()
    XCTAssertEqual(
      URL(filePath: path, directoryHint: .checkFileSystem, relativeTo: nil),
      URL.backport(filePath: path, directoryHint: .checkFileSystem, relativeTo: nil)
    )
  }

  func testInitializeWithNotExistingFilePath() {
    let path = "/path"
    XCTAssertEqual(
      URL(filePath: path, directoryHint: .checkFileSystem, relativeTo: nil),
      URL.backport(filePath: path, directoryHint: .checkFileSystem, relativeTo: nil)
    )
  }

  func testInitializeWithFilePathHavingTrailingSlash() {
    let path = "/path/"
    XCTAssertEqual(
      URL(filePath: path, directoryHint: .inferFromPath, relativeTo: nil),
      URL.backport(filePath: path, directoryHint: .inferFromPath, relativeTo: nil)
    )
  }

  func testInitializeWithFilePathNotHavingTrailingSlash() {
    let path = "/path"
    XCTAssertEqual(
      URL(filePath: path, directoryHint: .inferFromPath, relativeTo: nil),
      URL.backport(filePath: path, directoryHint: .inferFromPath, relativeTo: nil)
    )
  }
}
