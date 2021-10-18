//
//  Created by Cihat Gündüz on 18.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation
import AVFoundation

final class SpeechSynthesizer: NSObject {
  enum SupportedLanguage: String {
    case arabic = "ar"
    case english = "en"
    case german = "de"
    case turkish = "tr"

    var voices: [AVSpeechSynthesisVoice] {
      AVSpeechSynthesisVoice.speechVoices().filter { $0.language.components(separatedBy: "-")[0] == rawValue }
    }
  }

  let voice: AVSpeechSynthesisVoice
  let synthesizer: AVSpeechSynthesizer = .init()

  init(
    voice: AVSpeechSynthesisVoice
  ) {
    self.voice = voice
    super.init()
    synthesizer.delegate = self
  }

  func speak(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = voice
    utterance.pitchMultiplier = 1.0
    utterance.volume = 1.0
    utterance.rate = AVSpeechUtteranceDefaultSpeechRate
    utterance.preUtteranceDelay = .zero
    utterance.postUtteranceDelay = .zero

    synthesizer.speak(utterance)
  }

  func stop() {
    synthesizer.stopSpeaking(at: .immediate)
  }
}

extension SpeechSynthesizer: AVSpeechSynthesizerDelegate {
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
    // TODO: [cg_2021-10-18] not yet implemented
  }

  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
    // TODO: [cg_2021-10-18] not yet implemented
  }

  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
    // TODO: [cg_2021-10-18] not yet implemented
  }

  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
    // TODO: [cg_2021-10-18] not yet implemented
  }

  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
    // TODO: [cg_2021-10-18] not yet implemented
  }

  func speechSynthesizer(
    _ synthesizer: AVSpeechSynthesizer,
    willSpeakRangeOfSpeechString characterRange: NSRange,
    utterance: AVSpeechUtterance
  ) {
    // TODO: [cg_2021-10-18] not yet implemented
  }
}
