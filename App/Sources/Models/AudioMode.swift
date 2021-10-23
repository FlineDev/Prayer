//
//  Created by Cihat Gündüz on 23.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation

enum AudioMode: String, CaseIterable, Equatable {
  case movementSound
  case speechSynthesizer

  var displayDescription: String {
    switch self {
    case .movementSound:
      return L10n.AudioMode.movementSound

    case .speechSynthesizer:
      return L10n.AudioMode.speechSynthesizer
    }
  }
}
