import Foundation

public extension URL {
  struct Backport {
    private let base: URL

    init(
      base: URL
    ) {
      self.base = base
    }
  }

  static var backport: Backport.Type { Backport.self }
  var backport: Backport { Backport(base: self) }

  static func backport(filePath path: String, directoryHint: URL.Backport.DirectoryHint = .inferFromPath, relativeTo base: URL? = nil) -> URL {
    return URL(fileURLWithPath: path, isDirectory: path.isDirectory(hint: directoryHint), relativeTo: base)
  }

  static func backport(for directory: FileManager.SearchPathDirectory, in domain: FileManager.SearchPathDomainMask, appropriateFor url: URL? = nil, create shouldCreate: Bool = false) throws -> URL {
    return try FileManager.default.url(for: directory, in: domain, appropriateFor: url, create: shouldCreate)
  }
}

public extension URL.Backport {
  enum DirectoryHint: Equatable, Hashable, Sendable {
    case isDirectory
    case notDirectory
    case checkFileSystem
    case inferFromPath
  }

  static var homeDirectory: URL {
    URL(fileURLWithPath: NSHomeDirectory(), isDirectory: true)
  }

  static var temporaryDirectory: URL {
    URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
  }

  static var cachesDirectory: URL {
    try! URL.backport(for: .cachesDirectory, in: .userDomainMask)
  }

  static var applicationDirectory: URL {
    try! URL.backport(for: .applicationDirectory, in: .localDomainMask)
  }

  static var libraryDirectory: URL {
    try! URL.backport(for: .libraryDirectory, in: .userDomainMask)
  }

  static var userDirectory: URL {
    try! URL.backport(for: .userDirectory, in: .localDomainMask)
  }

  static var documentsDirectory: URL {
    try! URL.backport(for: .documentDirectory, in: .userDomainMask)
  }

  static var desktopDirectory: URL {
    try! URL.backport(for: .desktopDirectory, in: .userDomainMask)
  }

  static var applicationSupportDirectory: URL {
    try! URL.backport(for: .applicationSupportDirectory, in: .userDomainMask)
  }

  static var downloadsDirectory: URL {
    try! URL.backport(for: .downloadsDirectory, in: .userDomainMask)
  }

  static var moviesDirectory: URL {
    try! URL.backport(for: .moviesDirectory, in: .userDomainMask)
  }

  static var musicDirectory: URL {
    try! URL.backport(for: .musicDirectory, in: .userDomainMask)
  }

  static var picturesDirectory: URL {
    try! URL.backport(for: .picturesDirectory, in: .userDomainMask)
  }

  static var sharedPublicDirectory: URL {
    try! URL.backport(for: .sharedPublicDirectory, in: .userDomainMask)
  }

  @available(tvOS, unavailable)
  @available(watchOS, unavailable)
  static var trashDirectory: URL {
    try! URL.backport(for: .trashDirectory, in: .userDomainMask)
  }

  func appending<S>(path: S, directoryHint: URL.Backport.DirectoryHint = .inferFromPath) -> URL where S: StringProtocol {
    return base.appendingPathComponent(String(path), isDirectory: String(path).isDirectory(hint: directoryHint))
  }

  func appending(queryItems: [URLQueryItem]) -> URL {
    guard var urlComponents = URLComponents(url: base, resolvingAgainstBaseURL: true) else { return base }
    urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
    return urlComponents.url ?? base
  }

  static func currentDirectory() -> URL {
    return URL(fileURLWithPath: FileManager.default.currentDirectoryPath, isDirectory: true)
  }

  static func homeDirectory(forUser user: String) -> URL? {
    return NSHomeDirectoryForUser(user).map { URL(fileURLWithPath: $0, isDirectory: true) }
  }
}

private extension String {
  func isDirectory(hint: URL.Backport.DirectoryHint) -> Bool {
    switch hint {
    case .isDirectory:
      return true

    case .notDirectory:
      return false

    case .checkFileSystem:
      var isDirectory: ObjCBool = false
      FileManager.default.fileExists(atPath: self, isDirectory: &isDirectory)
      return isDirectory.boolValue

    case .inferFromPath:
      return hasSuffix("/")
    }
  }
}
