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
        "Persian Santoor", "Soft Waves", "Turkish Saz Zither", "Tweed Picked Synth"
    ]

    static let availableLanguageCodes: [String] = Bundle.main.localizations.filter { $0 != "Base" }

    // MARK: - Computed Instance Properties
    var rakatCount: Int {
        get { return Defaults[.rakatCount] }
        set { Defaults[.rakatCount] = newValue }
    }

    var fixedTextsSpeedFactor: Double {
        get { return Defaults[.fixedTextsSpeedFactor] }
        set { Defaults[.fixedTextsSpeedFactor] = newValue }
    }

    var changingTextSpeedFactor: Double {
        get { return Defaults[.changingTextSpeedFactor] }
        set { Defaults[.changingTextSpeedFactor] = newValue }
    }

    var showChangingTextName: Bool {
        get { return Defaults[.showChangingTextName] }
        set { Defaults[.showChangingTextName] = newValue }
    }

    private var currentLangCode: String { return Bundle.main.preferredLocalizations.first! }

    var interfaceLanguageCode: String {
        get { guard let langCode = Defaults[.interfaceLanguageCode]?.first else { return currentLangCode }; return langCode }
        set { Defaults[.interfaceLanguageCode] = [newValue]; Defaults.synchronize() }
    }

    var movementSoundInstrument: String {
        get { return Defaults[.movementSoundInstrument] }
        set { Defaults[.movementSoundInstrument] = newValue }
    }
}

extension DefaultsKeys {
    private static var defaultInstrument: String { return SettingsViewModel.availableMovementSoundInstruments.first! }

    static let rakatCount = DefaultsKey<Int>("RakatCount", defaultValue: 4)
    static let fixedTextsSpeedFactor = DefaultsKey<Double>("FixedTextsSpeedFactor", defaultValue: 1.0)
    static let changingTextSpeedFactor = DefaultsKey<Double>("ChangingTextSpeedFactor", defaultValue: 1.0)
    static let showChangingTextName = DefaultsKey<Bool>("ShowChangingTextName", defaultValue: true)
    static let interfaceLanguageCode = DefaultsKey<[String]?>("AppleLanguages") // see http://stackoverflow.com/a/9939963/3451975
    static let movementSoundInstrument = DefaultsKey<String>("MovementSoundInstrument", defaultValue: defaultInstrument)
}
