load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_framework")

package(default_visibility = ["//visibility:public"])

swift_library(
  name = "SwiftLib",
  copts = [
    "-embed-bitcode",
  ],
  srcs = glob(["Sources/*.swift"]),
)

ios_framework(
  name = "SwiftLib.framework",
  bundle_id = "com.foo.bar",
  hdrs = [
    "Sources/SwiftLib.h",
  ],
  bundle_name = "SwiftLib",
  families = [
    "iphone",
    "ipad",
  ],
  infoplists = [":Info.plist"],
  minimum_os_version = "12.1",
  deps = [
    ":SwiftLib",
  ],
)
