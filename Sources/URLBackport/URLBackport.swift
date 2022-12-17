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
}

public extension URL.Backport {
  enum DirectoryHint: Equatable, Hashable, Sendable {
    case isDirectory
    case notDirectory
    case checkFileSystem
    case inferFromPath
  }

  func appending<S>(path: S, directoryHint: URL.Backport.DirectoryHint = .inferFromPath) -> URL where S: StringProtocol {
    return base.appendingPathComponent(String(path), isDirectory: String(path).isDirectory(hint: directoryHint))
  }

  func appending(queryItems: [URLQueryItem]) -> URL {
    guard var urlComponents = URLComponents(url: base, resolvingAgainstBaseURL: true) else { return base }
    urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
    return urlComponents.url ?? base
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
