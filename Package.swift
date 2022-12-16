// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "URLBackport",
  products: [
    .library(name: "URLBackport", targets: ["URLBackport"]),
  ],
  targets: [
    .target(name: "URLBackport"),
    .testTarget(name: "URLBackportTests", dependencies: ["URLBackport"]),
  ]
)
