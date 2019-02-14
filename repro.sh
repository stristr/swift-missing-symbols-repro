#!/usr/bin/env bash

check_symbol() {
  if [ `grep -c "$1" "$2"` -gt 0 ]; then
    echo "$1 is in $3"
  else
    echo "$1 is NOT in $3"
  fi
}

bazel clean && bazel build :SwiftLib.framework -s
check_symbol WillBeIncluded bazel-out/ios-x86_64-min12.1-applebin_ios-ios_x86_64-fastbuild/bin/libSwiftLib.a 'object file'
check_symbol WillBeExcluded bazel-out/ios-x86_64-min12.1-applebin_ios-ios_x86_64-fastbuild/bin/libSwiftLib.a 'object file'
check_symbol WillBeIncluded bazel-bin/SwiftLib.framework_archive-root/SwiftLib.framework/SwiftLib 'framework binary'
check_symbol WillBeExcluded bazel-bin/SwiftLib.framework_archive-root/SwiftLib.framework/SwiftLib 'framework binary'
