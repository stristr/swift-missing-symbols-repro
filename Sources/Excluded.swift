import Foundation

// If I move the contents of this file into Included.swift, WillBeExcluded symbols are present
// in the final framework binary. Likewise, if I add any other class that extends NSObject
// in this file, WillBeExcluded symbols are present in the final framework binary. With no ObjC
// objects in this file, WillBeExcluded symbols are present in the object file created during the
// ``:SwiftLib` build process, but stripped when the binary is generated during the
// `:SwiftLib.framework.apple_binary` subcommand.
public class WillBeExcluded {
    public func sayBar() -> String {
        return "Bar"
    }
}
