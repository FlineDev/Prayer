//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import AVKit
import SwiftyUserDefaults
import UIKit

class SettingsViewModel {
  static let availableMovementSoundInstruments: [String] = [
    "Baroque Organ", "Bleep City", "Erhu", "Flow Motion", "Grand Piano with Pad & Choir", "Infinite Space",
    "Persian Santoor", "Soft Waves", "Turkish Saz Zither", "Tweed Picked Synth",
  ]

  var rakatCount: Int {
    get { Defaults.rakatCount }
    set { Defaults.rakatCount = newValue }
  }

  var fixedTextsSpeedFactor: Double {
    get { Defaults.fixedTextsSpeedFactor }
    set { Defaults.fixedTextsSpeedFactor = newValue }
  }

  var changingTextSpeedFactor: Double {
    get { Defaults.changingTextSpeedFactor }
    set { Defaults.changingTextSpeedFactor = newValue }
  }

  var showChangingTextName: Bool {
    get { Defaults.showChangingTextName }
    set { Defaults.showChangingTextName = newValue }
  }

  var allowLongerRecitations: Bool {
    get { Defaults.allowLongerRecitations }
    set { Defaults.allowLongerRecitations = newValue }
  }

  var allowSplittingRecitations: Bool {
    get { Defaults.allowSplittingRecitations }
    set { Defaults.allowSplittingRecitations = newValue }
  }

  var movementSoundInstrument: String {
    get { Defaults.movementSoundInstrument }
    set { Defaults.movementSoundInstrument = newValue }
  }

  var speechSynthesizerVoice: AVSpeechSynthesisVoice {
    get { AVSpeechSynthesisVoice(identifier: Defaults.speechSynthesizerVoiceId)! }
    set { Defaults.speechSynthesizerVoiceId = newValue.identifier }
  }

  var speechSynthesizerPitchMultiplier: Float {
    get { Float(Defaults.speechSynthesizerPitchMultiplier) }
    set { Defaults.speechSynthesizerPitchMultiplier = Double(newValue) }
  }

  var speechSynthesizerSpeechRate: Float {
    get { Float(Defaults.speechSynthesizerSpeechRate) }
    set { Defaults.speechSynthesizerSpeechRate = Double(newValue) }
  }

  var speechSynthesizer: SpeechSynthesizer {
    .init(
      voice: speechSynthesizerVoice,
      pitchMultiplier: speechSynthesizerPitchMultiplier,
      speechRate: speechSynthesizerSpeechRate
    )
  }

  var audioMode: AudioMode {
    get { Defaults.audioMode }
    set { Defaults.audioMode = newValue }
  }
}

extension DefaultsKeys {
  private var defaultInstrument: String { SettingsViewModel.availableMovementSoundInstruments.first! }
  private var defaultSpeechRate: Double { Double(AVSpeechUtteranceDefaultSpeechRate) }
  private var defaultVoice: String { SpeechSynthesizer.SupportedLanguage.bestMatchingVoice.identifier }

  var rakatCount: DefaultsKey<Int> { .init("RakatCount", defaultValue: 4) }
  var fixedTextsSpeedFactor: DefaultsKey<Double> { .init("FixedTextsSpeedFactor", defaultValue: 1.0) }
  var changingTextSpeedFactor: DefaultsKey<Double> { .init("ChangingTextSpeedFactor", defaultValue: 1.0) }
  var showChangingTextName: DefaultsKey<Bool> { .init("ShowChangingTextName", defaultValue: true) }
  var allowLongerRecitations: DefaultsKey<Bool> { .init("AllowLongerRecitations", defaultValue: false) }
  var allowSplittingRecitations: DefaultsKey<Bool> { .init("AllowSplittingRecitations", defaultValue: false) }
  var movementSoundInstrument: DefaultsKey<String> { .init("MovementSoundInstrument", defaultValue: defaultInstrument) }
  var speechSynthesizerVoiceId: DefaultsKey<String> { .init("VoiceId", defaultValue: defaultVoice) }
  var speechSynthesizerPitchMultiplier: DefaultsKey<Double> { .init("PitchMultiplier", defaultValue: 1.0) }
  var speechSynthesizerSpeechRate: DefaultsKey<Double> { .init("SpeechRate", defaultValue: defaultSpeechRate) }
  var audioMode: DefaultsKey<AudioMode> { .init("AudioMode", defaultValue: .movementSound) }
}

extension AudioMode: DefaultsSerializable {}
