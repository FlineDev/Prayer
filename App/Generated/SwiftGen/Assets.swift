// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
#endif

// MARK: - Asset Catalogs

internal typealias Colors = Asset.Colors
internal typealias Images = Asset.Images

internal enum Asset {
  internal enum Colors {
    internal enum Theme {
      internal static let accent = UIColor(named: "Theme/Accent", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
      internal static let barBackground = UIColor(named: "Theme/BarBackground", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
      internal static let contentBackground = UIColor(named: "Theme/ContentBackground", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
      internal static let primary = UIColor(named: "Theme/Primary", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
      internal static let secondary = UIColor(named: "Theme/Secondary", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    }
  }
  internal enum Images {
    internal static let background = UIImage(named: "Background", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let logo = UIImage(named: "Logo", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let separatorCompact = UIImage(named: "separator-compact", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
    internal static let separator = UIImage(named: "separator", in: Bundle(for: BundleToken.self), compatibleWith: nil)!
  }
}

// MARK: - Implementation Details

private final class BundleToken {}
