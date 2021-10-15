//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import SwiftyUserDefaults
import UIKit

class SettingsViewModel {
  // MARK: - Stored Instance Properties
  static let availableMovementSoundInstruments: [String] = [
    "Baroque Organ", "Bleep City", "Erhu", "Flow Motion", "Grand Piano with Pad & Choir", "Infinite Space",
    "Persian Santoor", "Soft Waves", "Turkish Saz Zither", "Tweed Picked Synth",
  ]

  // MARK: - Computed Instance Properties
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

  var movementSoundInstrument: String {
    get { Defaults.movementSoundInstrument }
    set { Defaults.movementSoundInstrument = newValue }
  }
}

extension DefaultsKeys {
  private var defaultInstrument: String { SettingsViewModel.availableMovementSoundInstruments.first! }

  var rakatCount: DefaultsKey<Int> { .init("RakatCount", defaultValue: 4) }
  var fixedTextsSpeedFactor: DefaultsKey<Double> { .init("FixedTextsSpeedFactor", defaultValue: 1.0) }
  var changingTextSpeedFactor: DefaultsKey<Double> { .init("ChangingTextSpeedFactor", defaultValue: 1.0) }
  var showChangingTextName: DefaultsKey<Bool> { .init("ShowChangingTextName", defaultValue: true) }
  var allowLongerRecitations: DefaultsKey<Bool> { .init("AllowLongerRecitations", defaultValue: false) }
  var movementSoundInstrument: DefaultsKey<String> { .init("MovementSoundInstrument", defaultValue: defaultInstrument) }
}
