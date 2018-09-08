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
        get { guard let intValue = Defaults[.rakatCount] else { return 4 }; return intValue }
        set { Defaults[.rakatCount] = newValue }
    }

    var fixedTextsSpeedFactor: Double {
        get { guard let doubleValue = Defaults[.fixedTextsSpeedFactor] else { return 1.0 }; return doubleValue }
        set { Defaults[.fixedTextsSpeedFactor] = newValue }
    }

    var changingTextSpeedFactor: Double {
        get { guard let doubleValue = Defaults[.changingTextSpeedFactor] else { return 1.0 }; return doubleValue }
        set { Defaults[.changingTextSpeedFactor] = newValue }
    }

    var showChangingTextName: Bool {
        get { guard let boolValue = Defaults[.showChangingTextName] else { return true }; return boolValue }
        set { Defaults[.showChangingTextName] = newValue }
    }

    private var currentLangCode: String { return Bundle.main.preferredLocalizations.first! }

    var interfaceLanguageCode: String {
        get { guard let langCode = Defaults[.interfaceLanguageCode]?.first else { return currentLangCode }; return langCode }
        set { Defaults[.interfaceLanguageCode] = [newValue]; Defaults.synchronize() }
    }

    private var defaultInstrument: String { return SettingsViewModel.availableMovementSoundInstruments.first! }

    var movementSoundInstrument: String {
        get { guard let instrument = Defaults[.movementSoundInstrument] else { return defaultInstrument }; return instrument }
        set { Defaults[.movementSoundInstrument] = newValue }
    }
}

extension DefaultsKeys {
    static let rakatCount = DefaultsKey<Int?>("RakatCount")
    static let fixedTextsSpeedFactor = DefaultsKey<Double?>("FixedTextsSpeedFactor")
    static let changingTextSpeedFactor = DefaultsKey<Double?>("ChangingTextSpeedFactor")
    static let showChangingTextName = DefaultsKey<Bool?>("ShowChangingTextName")
    static let interfaceLanguageCode = DefaultsKey<[String]?>("AppleLanguages") // see http://stackoverflow.com/a/9939963/3451975
    static let movementSoundInstrument = DefaultsKey<String?>("MovementSoundInstrument")
}
