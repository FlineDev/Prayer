//
//  Created by Cihat Gündüz on 18.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import Foundation
import AVFoundation
import HandySwift

final class SpeechSynthesizer: NSObject {
  enum SupportedLanguage: String {
    case english = "en"
    case german = "de"
    case turkish = "tr"

    static var current: SupportedLanguage {
      .init(rawValue: Locale.current.languageCode!)!
    }

    static var bestMatchingVoice: AVSpeechSynthesisVoice {
      guard let regionCode = Locale.current.regionCode else { return current.voices[0] }
      guard let voice = AVSpeechSynthesisVoice.speechVoices().first(where: { $0.language.hasSuffix(regionCode) }) else {
        return current.voices[0]
      }

      return voice
    }

    var voices: [AVSpeechSynthesisVoice] {
      AVSpeechSynthesisVoice.speechVoices().filter { $0.language.hasPrefix(rawValue) }
    }
  }

  let voice: AVSpeechSynthesisVoice
  let pitchMultiplier: Float
  let speechRate: Float

  let synthesizer: AVSpeechSynthesizer = .init()

  fileprivate var completionBlock: (() -> Void)?

  init(
    voice: AVSpeechSynthesisVoice,
    pitchMultiplier: Float,
    speechRate: Float
  ) {
    self.voice = voice
    self.pitchMultiplier = pitchMultiplier
    self.speechRate = speechRate

    super.init()
    synthesizer.delegate = self
  }

  func speak(text: String, completion: @escaping () -> Void) {
    let textToSpeak: String = {
      if text.contains("📖") {
        return text.replacingOccurrences(of: "📖", with: L10n.SpeechSynthesizer.bookEmojiReplacement)
      }
      else {
        // remove braces & brackets, e.g.: "storming (blindly) into [any] host" -> "storming blindly into any host"
        let bracesRegexes = [try! Regex(#"\((.*)\)"#), try! Regex(#"\[(.*)\]"#)]
        return bracesRegexes.reduce(text) { partialResult, bracesRegex in
          bracesRegex.replacingMatches(in: partialResult, with: "$1")
        }
      }
    }()

    let utterance = AVSpeechUtterance(string: textToSpeak)
    utterance.voice = voice
    utterance.pitchMultiplier = pitchMultiplier
    utterance.volume = 1.0
    utterance.rate = speechRate
    utterance.preUtteranceDelay = .zero
    utterance.postUtteranceDelay = .zero

    self.completionBlock = completion

    synthesizer.speak(utterance)
  }

  func stop() {
    self.completionBlock = nil
    synthesizer.stopSpeaking(at: .immediate)
  }
}

extension SpeechSynthesizer: AVSpeechSynthesizerDelegate {
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
    if let completionBlock = completionBlock {
      self.completionBlock = nil
      completionBlock()
    }
  }
}
