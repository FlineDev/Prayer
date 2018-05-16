// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4da1bd"></span>
  /// Alpha: 100% <br/> (0x4da1bdff)
  internal static let accent = ColorName(rgbaValue: 0x4da1bdff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d6d6d6"></span>
  /// Alpha: 100% <br/> (0xd6d6d6ff)
  internal static let background = ColorName(rgbaValue: 0xd6d6d6ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bd4da1"></span>
  /// Alpha: 100% <br/> (0xbd4da1ff)
  internal static let error = ColorName(rgbaValue: 0xbd4da1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#001024"></span>
  /// Alpha: 100% <br/> (0x001024ff)
  internal static let primary = ColorName(rgbaValue: 0x001024ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#154f69"></span>
  /// Alpha: 100% <br/> (0x154f69ff)
  internal static let secondary = ColorName(rgbaValue: 0x154f69ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a1bd4d"></span>
  /// Alpha: 100% <br/> (0xa1bd4dff)
  internal static let success = ColorName(rgbaValue: 0xa1bd4dff)
}
// swiftlint:enable identifier_name line_length type_body_length

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
