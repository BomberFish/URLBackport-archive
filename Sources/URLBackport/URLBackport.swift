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
