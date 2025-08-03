//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import AVFoundation

final class AudioPlayer {
   static let shared = AudioPlayer()

   private var audioPlayer: AVAudioPlayer?

   private init() {
      try? AVAudioSession.sharedInstance()
         .setCategory(
            .playback,
            mode: .voicePrompt,
            options: [.mixWithOthers, .allowAirPlay, .allowBluetooth, .allowBluetoothA2DP]
         )
   }

   func movementSoundUrl(name: String, instrument: String) -> URL? {
      Bundle.main.url(forResource: instrument, withExtension: "caf", subdirectory: name)
   }

   func playSound(at url: URL) {
      self.audioPlayer = try! AVAudioPlayer(contentsOf: url)
      self.audioPlayer?.prepareToPlay()
      self.audioPlayer?.play()
   }
}
