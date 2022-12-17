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

  func testAppendingDirectoryPath() {
    let url = URL(filePath: "/")
    let path = "path"
    XCTAssertEqual(
      url.appending(path: path, directoryHint: .isDirectory),
      url.backport.appending(path: path, directoryHint: .isDirectory)
    )
  }

  func testAppendingFilePath() {
    let url = URL(filePath: "/")
    let path = "path"
    XCTAssertEqual(
      url.appending(path: path, directoryHint: .notDirectory),
      url.backport.appending(path: path, directoryHint: .notDirectory)
    )
  }

  func testAppendingExistingPath() {
    let url = URL(filePath: NSHomeDirectory())
    let path = "Library"
    XCTAssertEqual(
      url.appending(path: path, directoryHint: .checkFileSystem),
      url.backport.appending(path: path, directoryHint: .checkFileSystem)
    )
  }

  func testAppendingNotExistingPath() {
    let url = URL(filePath: NSHomeDirectory())
    let path = "ライブラリー"
    XCTAssertEqual(
      url.appending(path: path, directoryHint: .checkFileSystem),
      url.backport.appending(path: path, directoryHint: .checkFileSystem)
    )
  }

  func testAppendingPathHavingTrailingSlash() {
    let url = URL(filePath: "/")
    let path = "path/"
    XCTAssertEqual(
      url.appending(path: path, directoryHint: .inferFromPath),
      url.backport.appending(path: path, directoryHint: .inferFromPath)
    )
  }

  func testAppendingPathNotHavingTrailingSlash() {
    let url = URL(filePath: "/")
    let path = "path"
    XCTAssertEqual(
      url.appending(path: path, directoryHint: .inferFromPath),
      url.backport.appending(path: path, directoryHint: .inferFromPath)
    )
  }

  func testAppendingQueryItems() {
    let url = URL(filePath: "/")
    let queryItems = [URLQueryItem(name: "name", value: "value")]
    XCTAssertEqual(
      url.appending(queryItems: queryItems),
      url.backport.appending(queryItems: queryItems)
    )
  }
}
