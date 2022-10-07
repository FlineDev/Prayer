import Foundation
import SwiftyUserDefaults

// NOTE: Workaround for a compiler bug, see here: https://github.com/sunshinejr/SwiftyUserDefaults/issues/285#issuecomment-1081226108
extension DefaultsSerializable where Self: Codable {
   public typealias Bridge = DefaultsCodableBridge<Self>
   public typealias ArrayBridge = DefaultsCodableBridge<[Self]>
}

extension DefaultsSerializable where Self: RawRepresentable {
   typealias Bridge = DefaultsRawRepresentableBridge<Self>
   typealias ArrayBridge = DefaultsRawRepresentableArrayBridge<[Self]>
}
