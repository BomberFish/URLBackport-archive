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

  func testHomeDirectory() {
    XCTAssertEqual(
      URL.homeDirectory,
      URL.backport.homeDirectory
    )
  }

  func testTemporaryDirectory() {
    XCTAssertEqual(
      URL.temporaryDirectory,
      URL.backport.temporaryDirectory
    )
  }

  func testCachesDirectory() {
    XCTAssertEqual(
      URL.cachesDirectory,
      URL.backport.cachesDirectory
    )
  }

  func testApplicationDirectory() {
    XCTAssertEqual(
      URL.applicationDirectory,
      URL.backport.applicationDirectory
    )
  }

  func testLibraryDirectory() {
    XCTAssertEqual(
      URL.libraryDirectory,
      URL.backport.libraryDirectory
    )
  }

  func testUserDirectory() {
    XCTAssertEqual(
      URL.userDirectory,
      URL.backport.userDirectory
    )
  }

  func testDocumentsDirectory() {
    XCTAssertEqual(
      URL.documentsDirectory,
      URL.backport.documentsDirectory
    )
  }

  func testDesktopDirectory() {
    XCTAssertEqual(
      URL.desktopDirectory,
      URL.backport.desktopDirectory
    )
  }

  func testApplicationSupportDirectory() {
    XCTAssertEqual(
      URL.applicationSupportDirectory,
      URL.backport.applicationSupportDirectory
    )
  }

  func testDownloadsDirectory() {
    XCTAssertEqual(
      URL.downloadsDirectory,
      URL.backport.downloadsDirectory
    )
  }

  func testMoviesDirectory() {
    XCTAssertEqual(
      URL.moviesDirectory,
      URL.backport.moviesDirectory
    )
  }

  func testMusicDirectory() {
    XCTAssertEqual(
      URL.musicDirectory,
      URL.backport.musicDirectory
    )
  }

  func testPicturesDirectory() {
    XCTAssertEqual(
      URL.picturesDirectory,
      URL.backport.picturesDirectory
    )
  }

  func testSharedPublicDirectory() {
    XCTAssertEqual(
      URL.sharedPublicDirectory,
      URL.backport.sharedPublicDirectory
    )
  }

  #if os(macOS)
  func testTrashDirectory() {
    XCTAssertEqual(
      URL.trashDirectory,
      URL.backport.trashDirectory
    )
  }
  #endif

  func testUserPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.user = "ユーザー"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.user(percentEncoded: true),
      url.backport.user(percentEncoded: true)
    )
  }

  func testUserNotPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.user = "ユーザー"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.user(percentEncoded: false),
      url.backport.user(percentEncoded: false)
    )
  }

  func testPasswordPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.password = "パスワード"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.password(percentEncoded: true),
      url.backport.password(percentEncoded: true)
    )
  }

  func testPasswordNotPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.password = "パスワード"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.password(percentEncoded: false),
      url.backport.password(percentEncoded: false)
    )
  }

  func testHostPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.host = "ホスト"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.host(percentEncoded: true),
      url.backport.host(percentEncoded: true)
    )
  }

  func testHostNotPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.host = "ホスト"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.host(percentEncoded: false),
      url.backport.host(percentEncoded: false)
    )
  }

  func testPathPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.path = "パス"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.path(percentEncoded: true),
      url.backport.path(percentEncoded: true)
    )
  }

  func testPathNotPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.path = "パス"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.path(percentEncoded: false),
      url.backport.path(percentEncoded: false)
    )
  }

  func testQueryPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.query = "クエリ"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.query(percentEncoded: true),
      url.backport.query(percentEncoded: true)
    )
  }

  func testQueryNotPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.query = "クエリ"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.query(percentEncoded: false),
      url.backport.query(percentEncoded: false)
    )
  }

  func testFragmentPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.fragment = "フラグメント"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.fragment(percentEncoded: true),
      url.backport.fragment(percentEncoded: true)
    )
  }

  func testFragmentNotPercentEncoded() {
    var urlComponents = URLComponents()
    urlComponents.fragment = "フラグメント"
    let url = urlComponents.url!
    XCTAssertEqual(
      url.fragment(percentEncoded: false),
      url.backport.fragment(percentEncoded: false)
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

  func testCurrentDirectory() {
    XCTAssertEqual(
      URL.currentDirectory(),
      URL.backport.currentDirectory()
    )
  }

  func testHomeDirectoryForUser() {
    let user = NSUserName()
    XCTAssertEqual(
      URL.homeDirectory(forUser: user),
      URL.backport.homeDirectory(forUser: user)
    )
  }
}
