//
//  Created by Cihat Gündüz on 23.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation

enum AudioMode: String, CaseIterable, Equatable {
   case movementSound
   case speechSynthesizer
   case movementSoundAndSpeechSynthesizer
   case none

   var displayDescription: String {
      switch self {
      case .movementSound:
         return L10n.AudioMode.MovementSound.string

      case .speechSynthesizer:
         return L10n.AudioMode.SpeechSynthesizer.string

      case .movementSoundAndSpeechSynthesizer:
         return L10n.AudioMode.MovementSoundAndSpeechSynthesizer.string

      case .none:
         return L10n.AudioMode.None.string
      }
   }
}
