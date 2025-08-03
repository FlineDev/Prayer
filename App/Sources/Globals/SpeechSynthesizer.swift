//
//  Created by Cihat Gündüz on 18.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import AVFoundation
import Foundation
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

   fileprivate var afterStart: (() -> Void)?
   fileprivate var afterStartDelay: TimeInterval?

   fileprivate var afterCompletion: (() -> Void)?
   fileprivate var afterCompletionDelay: TimeInterval?

   init(
      voice: AVSpeechSynthesisVoice,
      pitchMultiplier: Float,
      speechRate: Float
   ) {
      self.voice = voice
      self.pitchMultiplier = pitchMultiplier
      self.speechRate = speechRate

      try? AVAudioSession.sharedInstance()
         .setCategory(
            .playback,
            mode: .voicePrompt,
            options: [.mixWithOthers, .allowAirPlay, .allowBluetooth, .allowBluetoothA2DP]
         )

      super.init()
      self.synthesizer.delegate = self
   }

   func speak(
      text: String,
      afterStart: (() -> Void)? = nil,
      afterStartDelay: TimeInterval? = nil,
      afterCompletion: (() -> Void)? = nil,
      afterCompletionDelay: TimeInterval? = nil
   ) {
      let textToSpeak: String = {
         if text.contains(String.recitationEmoji) {
            return text.replacingOccurrences(of: "📖", with: L10n.SpeechSynthesizer.BookEmojiReplacement.string)
         } else {
            // remove braces & brackets, e.g.: "storming (blindly) into [any] host" -> "storming blindly into any host"
            let bracesRegexes = [try! Regex(#"\((.*)\)"#), try! Regex(#"\[(.*)\]"#)]
            return bracesRegexes.reduce(text) { partialResult, bracesRegex in
               bracesRegex.replacingMatches(in: partialResult, with: "$1")
            }
         }
      }()

      let utterance = AVSpeechUtterance(string: textToSpeak)
      utterance.voice = self.voice
      utterance.pitchMultiplier = self.pitchMultiplier
      utterance.volume = 1.0
      utterance.rate = self.speechRate
      utterance.preUtteranceDelay = .zero
      utterance.postUtteranceDelay = .zero

      self.afterStart = afterStart
      self.afterStartDelay = afterStartDelay

      self.afterCompletion = afterCompletion
      self.afterCompletionDelay = afterCompletionDelay

      self.synthesizer.speak(utterance)
   }

   func stop() {
      self.afterStart = nil
      self.afterCompletion = nil
      self.synthesizer.stopSpeaking(at: .immediate)
   }
}

extension SpeechSynthesizer: AVSpeechSynthesizerDelegate {
   func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
      if let afterStart = afterStart {
         delay(by: self.afterStartDelay ?? .zero) {
            self.afterStart = nil
            self.afterStartDelay = nil
            afterStart()
         }
      }
   }

   func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
      if let afterCompletion = afterCompletion {
         delay(by: self.afterCompletionDelay ?? .zero) {
            self.afterCompletion = nil
            self.afterCompletionDelay = nil
            afterCompletion()
         }
      }
   }
}
