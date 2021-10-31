// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
#endif


internal typealias Colors = Asset.Colors
internal typealias Images = Asset.Images

internal enum Asset {
  internal enum Colors {
    internal static let accentColor = UIColor(named: "AccentColor", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let contentBackground = UIColor(named: "ContentBackground", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let primary = UIColor(named: "Primary", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let secondary = UIColor(named: "Secondary", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
  }
  internal enum Images {
    internal static let background = UIImage(named: "Background", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let logo = UIImage(named: "Logo", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let separatorCompact = UIImage(named: "separator-compact", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let separator = UIImage(named: "separator", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
  }
}


private final class BundleToken {}
