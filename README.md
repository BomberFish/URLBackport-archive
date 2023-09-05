# URLBackport

> This is an archive of version 1.0 of [URLBackport](https://github.com/woxtu/URLBackport) from my Xcode cache. Original by woxtu, who seems to have deleted the repository.

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg?style=flat-square)](https://github.com/apple/swift-package-manager)

A backport of the new API added to [`URL`](https://developer.apple.com/documentation/foundation/url) in iOS 16.

```swift
import URLBackport

// Initialize a file URL
let fileURL = URL.backport(filePath: "/")

// Get components
let path = fileURL.backport.path()

// Append components
let newURL = fileURL
  .backport.appending(path: "path")
  .backport.appending(queryItems: [URLQueryItem(name: "name", value: "value")])

// Get the standard directories
let homeDirectory = URL.backport.homeDirectory
```

This package provides the following API:

- `enum DirectoryHint`
- `init(filePath: String, directoryHint: URL.DirectoryHint, relativeTo: URL?)`
  - NOTE: This initializer is implemented as the type method `URL.backport(filePath:directoryHint:relativeTo:)`
- `init(for: FileManager.SearchPathDirectory, in: FileManager.SearchPathDomainMask, appropriateFor: URL?, create: Bool)`
  - NOTE: This initializer is implemented as the type method `URL.backport(for:in:appropriateFor:create:)`
- `static var applicationDirectory: URL`
- `static var applicationSupportDirectory: URL`
- `static var cachesDirectory: URL`
- `static var desktopDirectory: URL`
- `static var documentsDirectory: URL`
- `static var downloadsDirectory: URL`
- `static var homeDirectory: URL`
- `static var libraryDirectory: URL`
- `static var moviesDirectory: URL`
- `static var musicDirectory: URL`
- `static var picturesDirectory: URL`
- `static var sharedPublicDirectory: URL`
- `static var temporaryDirectory: URL`
- `static var trashDirectory: URL`
- `static var userDirectory: URL`
- `func appending<S>(path: S, directoryHint: URL.DirectoryHint) -> URL`
- `func appending(queryItems: [URLQueryItem]) -> URL`
- `func fragment(percentEncoded: Bool) -> String?`
- `func host(percentEncoded: Bool) -> String?`
- `func password(percentEncoded: Bool) -> String?`
- `func path(percentEncoded: Bool) -> String`
- `func query(percentEncoded: Bool) -> String?`
- `func user(percentEncoded: Bool) -> String?`
- `static func currentDirectory() -> URL`
- `static func homeDirectory(forUser: String) -> URL?`

## Installation

### Swift Package Manager

```swift
.package(url: "https://github.com/BomberFish/URLBackport-archive.git", from: "1.0.0")
```

## License

Licensed under the MIT license.
