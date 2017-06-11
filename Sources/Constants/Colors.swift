// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#elseif os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#endif

// swiftlint:disable operator_usage_whitespace
extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
enum ColorName {
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4da1bd"></span>
  /// Alpha: 100% <br/> (0x4da1bdff)
  case accent
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d6d6d6"></span>
  /// Alpha: 100% <br/> (0xd6d6d6ff)
  case background
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#bd4da1"></span>
  /// Alpha: 100% <br/> (0xbd4da1ff)
  case error
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#001024"></span>
  /// Alpha: 100% <br/> (0x001024ff)
  case primary
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#154f69"></span>
  /// Alpha: 100% <br/> (0x154f69ff)
  case secondary
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a1bd4d"></span>
  /// Alpha: 100% <br/> (0xa1bd4dff)
  case success

  var rgbaValue: UInt32 {
    switch self {
    case .accent:
      return 0x4da1bdff
    case .background:
      return 0xd6d6d6ff
    case .error:
      return 0xbd4da1ff
    case .primary:
      return 0x001024ff
    case .secondary:
      return 0x154f69ff
    case .success:
      return 0xa1bd4dff
    }
  }

  var color: Color {
    return Color(named: self)
  }
}
// swiftlint:enable type_body_length

extension Color {
  convenience init(named name: ColorName) {
    self.init(rgbaValue: name.rgbaValue)
  }
}
// swiftlint:enable file_length
// swiftlint:enable line_length
