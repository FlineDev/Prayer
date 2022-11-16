// swiftlint:disable all
// swiftformat:disable all
// swift-format-ignore-file
// AnyLint.skipInFile: All

// This file is maintained by ReMafoX (https://remafox.app) – manual edits will be overridden.

import Foundation
import SwiftUI

/// Top-level shortcut for ``Res.Str``. Provides safe access to localized strings. Managed by ReMafoX (https://remafox.app).
internal typealias L10n = Res.Str

/// Top-level namespace for safe resource access. Managed by ReMafoX (https://remafox.app).
internal enum Res {
   /// Root namespace for safe access to localized strings. Managed by ReMafoX (https://remafox.app).
   internal enum Str {
      internal enum AudioMode {
         /// 🇺🇸 English: "Position change sound"
         internal enum MovementSound {
            /// The translated `String` instance.
            internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

            /// The SwiftUI `LocalizedStringKey` instance.
            internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

            /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
            internal static var tableLookupKey: String { "AUDIO_MODE.MOVEMENT_SOUND" }
         }

         /// 🇺🇸 English: "Both (sound + voice)"
         internal enum MovementSoundAndSpeechSynthesizer {
            /// The translated `String` instance.
            internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

            /// The SwiftUI `LocalizedStringKey` instance.
            internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

            /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
            internal static var tableLookupKey: String { "AUDIO_MODE.MOVEMENT_SOUND_AND_SPEECH_SYNTHESIZER" }
         }

         /// 🇺🇸 English: "No audio (muted)"
         internal enum None {
            /// The translated `String` instance.
            internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

            /// The SwiftUI `LocalizedStringKey` instance.
            internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

            /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
            internal static var tableLookupKey: String { "AUDIO_MODE.NONE" }
         }

         /// 🇺🇸 English: "Reading computer voice"
         internal enum SpeechSynthesizer {
            /// The translated `String` instance.
            internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

            /// The SwiftUI `LocalizedStringKey` instance.
            internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

            /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
            internal static var tableLookupKey: String { "AUDIO_MODE.SPEECH_SYNTHESIZER" }
         }
      }

      internal enum PrayerView {
         internal enum Countdown {
            /// 🇺🇸 English: "Countdown"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "PRAYER_VIEW.COUNTDOWN.NAME" }
            }
         }
      }

      internal enum RakahComponent {
         internal enum OpeningSupplication {
            /// 🇺🇸 English: "Opening Supplication"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.OPENING_SUPPLICATION.NAME" }
            }
         }

         internal enum Rabbanagh {
            /// 🇺🇸 English: "Rabbanagh"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.RABBANAGH.NAME" }
            }
         }

         internal enum Ruku {
            /// 🇺🇸 English: "Ruku"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.RUKU.NAME" }
            }
         }

         internal enum Sajdah {
            /// 🇺🇸 English: "Sajdah"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.SAJDAH.NAME" }
            }
         }

         internal enum Salam {
            /// 🇺🇸 English: "Salâm"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.SALAM.NAME" }
            }
         }

         internal enum SalatulIbrahimiyyah {
            /// 🇺🇸 English: "Salatul-'Ibrahimiyyah"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.SALATUL_IBRAHIMIYYAH.NAME" }
            }
         }

         /// 🇺🇸 English: "%1$@ – part %2$d of %3$d"
         internal struct SplitRecitationTitle {
            internal let unnamedParam1: String
            internal let unnamedParam2: Int
            internal let unnamedParam3: Int

            internal init(_ unnamedParam1: String, _ unnamedParam2: Int, _ unnamedParam3: Int) {
               self.unnamedParam1 = unnamedParam1
               self.unnamedParam2 = unnamedParam2
               self.unnamedParam3 = unnamedParam3
            }

            /// The translated `String` instance.
            internal var string: String {
               let localizedFormatString = Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable")
               return String.localizedStringWithFormat(localizedFormatString, self.unnamedParam1, self.unnamedParam2, self.unnamedParam3)
            }

            /// The SwiftUI `LocalizedStringKey` instance.
            @available(*, unavailable, message: "'LocalizedStringKey' support requires the translation key 'RAKAH_COMPONENT.SPLIT_RECITATION_TITLE' to end with named parameters like in 'User.Description(username: %@, birthYear: %d)'")
            internal var locStringKey: LocalizedStringKey { fatalError() }

            /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
            internal var tableLookupKey: String { "RAKAH_COMPONENT.SPLIT_RECITATION_TITLE" }
         }

         internal enum StraighteningUp {
            /// 🇺🇸 English: "Straightening Up"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.STRAIGHTENING_UP.NAME" }
            }
         }

         internal enum Taawwudh {
            /// 🇺🇸 English: "Ta'awwudh"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.TAAWWUDH.NAME" }
            }
         }

         internal enum Takbir {
            /// 🇺🇸 English: "Takbīr"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.TAKBIR.NAME" }
            }
         }

         internal enum Tashahhud {
            /// 🇺🇸 English: "Tashahhud"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RAKAH_COMPONENT.TASHAHHUD.NAME" }
            }
         }
      }

      internal enum Recitation {
         internal enum Assistance {
            /// 🇺🇸 English: "al-Ma'Un (Assistance)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.ASSISTANCE.NAME" }
            }
         }

         internal enum Destiny {
            /// 🇺🇸 English: "Al-Qadr (Destiny)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.DESTINY.NAME" }
            }
         }

         internal enum Divorce {
            /// 🇺🇸 English: "At-Talaq (Divorce)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.DIVORCE.NAME" }
            }
         }

         internal enum Dominion {
            /// 🇺🇸 English: "Al-Mulk (Dominion)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.DOMINION.NAME" }
            }
         }

         internal enum GoodInAbundance {
            /// 🇺🇸 English: "al-Kawthar (Good in Abundance)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.GOOD_IN_ABUNDANCE.NAME" }
            }
         }

         internal enum GreedForMoreAndMore {
            /// 🇺🇸 English: "At-Takathur (Greed For More And More)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.GREED_FOR_MORE_AND_MORE.NAME" }
            }
         }

         internal enum HeFrowned {
            /// 🇺🇸 English: "'Abasa (He Frowned)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.HE_FROWNED.NAME" }
            }
         }

         internal enum Iron {
            /// 🇺🇸 English: "Al-Hadid (Iron)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.IRON.NAME" }
            }
         }

         internal enum LossAndGain {
            /// 🇺🇸 English: "At-Taghabun (Loss And Gain)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.LOSS_AND_GAIN.NAME" }
            }
         }

         internal enum Man {
            /// 🇺🇸 English: "Al-Insan (Man)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.MAN.NAME" }
            }
         }

         internal enum Men {
            /// 🇺🇸 English: "an-Nas (Men)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.MEN.NAME" }
            }
         }

         internal enum Noah {
            /// 🇺🇸 English: "Nuh (Noah)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.NOAH.NAME" }
            }
         }

         internal enum Prohibition {
            /// 🇺🇸 English: "At-Tahrim (Prohibition)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.PROHIBITION.NAME" }
            }
         }

         internal enum Quraysh {
            /// 🇺🇸 English: "Quraysch"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.QURAYSH.NAME" }
            }
         }

         internal enum Resurrection {
            /// 🇺🇸 English: "Al-Qiyamah (Resurrection)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.RESURRECTION.NAME" }
            }
         }

         internal enum ShroudingInDarkness {
            /// 🇺🇸 English: "At-Takwir (Shrouding In Darkness)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.SHROUDING_IN_DARKNESS.NAME" }
            }
         }

         internal enum Succour {
            /// 🇺🇸 English: "an-Nasr (Succour)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.SUCCOUR.NAME" }
            }
         }

         internal enum ThatWhichComesInTheNight {
            /// 🇺🇸 English: "At-Tariq (That Which Comes In The Night)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THAT_WHICH_COMES_IN_THE_NIGHT.NAME" }
            }
         }

         internal enum ThatWhichMustComeToPass {
            /// 🇺🇸 English: "Al-Waqiah (That Which Must Come To Pass)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THAT_WHICH_MUST_COME_TO_PASS.NAME" }
            }
         }

         internal enum TheAllHighest {
            /// 🇺🇸 English: "Al-A'La (The All-Highest)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_ALL_HIGHEST.NAME" }
            }
         }

         internal enum TheBrightMorningHours {
            /// 🇺🇸 English: "Ad-Duha (The Bright Morning Hours)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_BRIGHT_MORNING_HOURS.NAME" }
            }
         }

         internal enum TheChargers {
            /// 🇺🇸 English: "Al-Adiyat (The Chargers)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_CHARGERS.NAME" }
            }
         }

         internal enum TheCleavingAsunder {
            /// 🇺🇸 English: "Al-Infitar (The Cleaving Asunder)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_CLEAVING_ASUNDER.NAME" }
            }
         }

         internal enum TheCongregation {
            /// 🇺🇸 English: "Al-Jumu'ah (The Congregation)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_CONGREGATION.NAME" }
            }
         }

         internal enum TheDaybreak {
            /// 🇺🇸 English: "Al-Fajr (The Daybreak)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_DAYBREAK.NAME" }
            }
         }

         internal enum TheDecleratiionOfGodsPerfection {
            /// 🇺🇸 English: "al-Ikhlas (The Decleration Of [God's] Perfection)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_DECLERATIION_OF_GODS_PERFECTION.NAME" }
            }
         }

         internal enum TheEarthquake {
            /// 🇺🇸 English: "Al-Zalzalah (The Earthquake)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_EARTHQUAKE.NAME" }
            }
         }

         internal enum TheElephant {
            /// 🇺🇸 English: "al-Fil (The Elephant)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_ELEPHANT.NAME" }
            }
         }

         internal enum TheEnfoldedOne {
            /// 🇺🇸 English: "Al-Muddaththir (The Enfolded One)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_ENFOLDED_ONE.NAME" }
            }
         }

         internal enum TheEnwrappedOne {
            /// 🇺🇸 English: "Al-Muzzammil (The Enwrapped One)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_ENWRAPPED_ONE.NAME" }
            }
         }

         internal enum TheEvidenceOfTheTruth {
            /// 🇺🇸 English: "Al-Bayyinah (The Evidence Of The Truth)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_EVIDENCE_OF_THE_TRUTH.NAME" }
            }
         }

         internal enum TheExaminedOne {
            /// 🇺🇸 English: "Al-Mumtahanah (The Examined One)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_EXAMINED_ONE.NAME" }
            }
         }

         internal enum TheFig {
            /// 🇺🇸 English: "At-Tin (The Fig)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_FIG.NAME" }
            }
         }

         internal enum TheFlightOfTime {
            /// 🇺🇸 English: "al-'Asr (The Flight Of Time)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_FLIGHT_OF_TIME.NAME" }
            }
         }

         internal enum TheGathering {
            /// 🇺🇸 English: "Al-Hashr (The Gathering)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_GATHERING.NAME" }
            }
         }

         internal enum TheGermCell {
            /// 🇺🇸 English: "Al-Alaq (The Germ-Cell)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_GERM_CELL.NAME" }
            }
         }

         internal enum TheGreatConstellations {
            /// 🇺🇸 English: "Al-Buruj (The Great Constellations)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_GREAT_CONSTELLATIONS.NAME" }
            }
         }

         internal enum TheHypocrites {
            /// 🇺🇸 English: "Al-Munafiqun (The Hypocrites)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_HYPOCRITES.NAME" }
            }
         }

         internal enum TheLand {
            /// 🇺🇸 English: "Al-Balad (The Land)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_LAND.NAME" }
            }
         }

         internal enum TheLayingBareOfTheTruth {
            /// 🇺🇸 English: "Al-Haqqah (The Laying-Bare Of The Truth)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_LAYING_BARE_OF_THE_TRUTH.NAME" }
            }
         }

         internal enum TheMostGracious {
            /// 🇺🇸 English: "Ar-Rahman (The Most Gracious)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_MOST_GRACIOUS.NAME" }
            }
         }

         internal enum TheNight {
            /// 🇺🇸 English: "Al-Layl (The Night)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_NIGHT.NAME" }
            }
         }

         internal enum TheOpening {
            /// 🇺🇸 English: "al-Fatiha (The Opening)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_OPENING.NAME" }
            }
         }

         internal enum TheOpeningUpOfTheHeart {
            /// 🇺🇸 English: "Ash-Sharh (The Opening-Up Of The Heart)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_OPENING_UP_OF_THE_HEART.NAME" }
            }
         }

         internal enum TheOvershadowingEvent {
            /// 🇺🇸 English: "Al-Ghashiyah (The Overshadowing Event)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_OVERSHADOWING_EVENT.NAME" }
            }
         }

         internal enum ThePen {
            /// 🇺🇸 English: "Al-Qalam (The Pen)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_PEN.NAME" }
            }
         }

         internal enum ThePleading {
            /// 🇺🇸 English: "Al-Mujadalah (The Pleading)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_PLEADING.NAME" }
            }
         }

         internal enum TheRanks {
            /// 🇺🇸 English: "As-Saff (The Ranks)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_RANKS.NAME" }
            }
         }

         internal enum TheRisingDawn {
            /// 🇺🇸 English: "al-Falaq (The Rising Dawn)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_RISING_DAWN.NAME" }
            }
         }

         internal enum TheSlanderer {
            /// 🇺🇸 English: "al-Humaza (The Slanderer)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_SLANDERER.NAME" }
            }
         }

         internal enum TheSplittingAsunder {
            /// 🇺🇸 English: "Al-Inshiqaq (The Splitting Asunder)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_SPLITTING_ASUNDER.NAME" }
            }
         }

         internal enum TheSuddenCalamity {
            /// 🇺🇸 English: "Al-Qariah (The Sudden Calamity)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_SUDDEN_CALAMITY.NAME" }
            }
         }

         internal enum TheSun {
            /// 🇺🇸 English: "Ash-Shams (The Sun)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_SUN.NAME" }
            }
         }

         internal enum TheTiding {
            /// 🇺🇸 English: "An-Naba (The Tiding)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_TIDING.NAME" }
            }
         }

         internal enum TheTwistedStrands {
            /// 🇺🇸 English: "al-Masad (The Twisted Strands)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_TWISTED_STRANDS.NAME" }
            }
         }

         internal enum TheUnseenBeings {
            /// 🇺🇸 English: "Al-Jinn (The Unseen Beings)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_UNSEEN_BEINGS.NAME" }
            }
         }

         internal enum TheWaysOfAscent {
            /// 🇺🇸 English: "Al-Ma'Arij (The Ways Of Ascent)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THE_WAYS_OF_ASCENT.NAME" }
            }
         }

         internal enum ThoseSentForth {
            /// 🇺🇸 English: "Al-Mursalat (Those Sent Forth)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THOSE_SENT_FORTH.NAME" }
            }
         }

         internal enum ThoseThatRise {
            /// 🇺🇸 English: "An-Nazi'at (Those That Rise)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THOSE_THAT_RISE.NAME" }
            }
         }

         internal enum ThoseWhoDenyTheTruth {
            /// 🇺🇸 English: "al-Kafirun (Those Who Deny The Truth)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THOSE_WHO_DENY_THE_TRUTH.NAME" }
            }
         }

         internal enum ThoseWhoGiveShortMeasure {
            /// 🇺🇸 English: "Al-Mutaffifin (Those Who Give Short Measure)"
            internal enum Name {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "RECITATION.THOSE_WHO_GIVE_SHORT_MEASURE.NAME" }
            }
         }
      }

      internal enum Settings {
         internal enum AppSection {
            internal enum ChangeLanguageButton {
               /// 🇺🇸 English: "Change language in ⚙️ Settings"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.APP_SECTION.CHANGE_LANGUAGE_BUTTON.TITLE" }
               }
            }

            /// 🇺🇸 English: "The language of the app determines the language of the texts shown during a prayer. Apple provides an app-specific language setting in the Settings app. Please use it to change the language of this app and the prayers."
            internal enum Footer {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.APP_SECTION.FOOTER" }
            }

            /// 🇺🇸 English: "App Settings"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.APP_SECTION.TITLE" }
            }
         }

         internal enum Audio {
            internal enum OutputDevice {
               /// 🇺🇸 English: "Select output device (via AirPlay icon):"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO.OUTPUT_DEVICE.TITLE" }
               }
            }

            internal enum SpeechSynthesizer {
               /// 🇺🇸 English: "Pitch multiplicator"
               internal enum PitchMultiplier {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO.SPEECH_SYNTHESIZER.PITCH_MULTIPLIER" }
               }

               /// 🇺🇸 English: "Speech rate"
               internal enum SpeechRate {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO.SPEECH_SYNTHESIZER.SPEECH_RATE" }
               }

               /// 🇺🇸 English: "Voice"
               internal enum Voice {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO.SPEECH_SYNTHESIZER.VOICE" }
               }
            }
         }

         internal enum AudioSpeedSection {
            internal enum AudioMode {
               /// 🇺🇸 English: "Audio Mode"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO_SPEED_SECTION.AUDIO_MODE.TITLE" }
               }
            }

            internal enum ChangingText {
               /// 🇺🇸 English: "Quran sura speed"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO_SPEED_SECTION.CHANGING_TEXT.TITLE" }
               }
            }

            internal enum FixedTexts {
               /// 🇺🇸 English: "Other texts speed"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO_SPEED_SECTION.FIXED_TEXTS.TITLE" }
               }
            }

            /// 🇺🇸 English: "Choose one of the two available audio modes, or both or none. The first only plays a short sound when changing positions during a prayer. The second will instead read out loud the full prayer text so you can just listen. This also works when the device is locked in your pocket. This can for example be useful when you want to do your prayers in your preferred language without others in the same Prayer room noticing it."
            internal enum Footer {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.AUDIO_SPEED_SECTION.FOOTER" }
            }

            internal enum MovementSoundInstrument {
               /// 🇺🇸 English: "Movement sound"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.AUDIO_SPEED_SECTION.MOVEMENT_SOUND_INSTRUMENT.TITLE" }
               }
            }

            /// 🇺🇸 English: "Audio & Speed Settings"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.AUDIO_SPEED_SECTION.TITLE" }
            }
         }

         internal enum ChangeMovementSoundSheet {
            /// 🇺🇸 English: "Choose movement instrument"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.CHANGE_MOVEMENT_SOUND_SHEET.TITLE" }
            }
         }

         internal enum FaqButton {
            /// 🇺🇸 English: "FAQ"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.FAQ_BUTTON.TITLE" }
            }
         }

         internal enum FaqEntries {
            internal enum AppMotivation {
               /// 🇺🇸 English: "This App currently has two goals:\n1. Becoming aware of what you are actually saying when you pray.\n2. Use the regular prayers to read the Quran.\n\nCurrently the app contains only the last 60 surahs of the Quran and randomly selects between them while one is staying during a prayer, but this is only the first step. With updates we are to follow all the missing surahs, and we also have a solution for longer surahs so that you can read them bit by bit to be able to pray and understand them without losing context.\n\nSpecifically NOT the purpose of this app is to teach praying from the ground up. Knowledge of the fundamentals of the prayers is already assumed, the app is intended primarily to move from doing your prayers in a foreign language (Arabic) to a language which you already mastered (currently: English, German and Turkish)."
               internal enum Answer {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.ANSWER" }
               }

               /// 🇺🇸 English: "What is the purpose of this app?"
               internal enum Question {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.QUESTION" }
               }
            }

            internal enum IpadReading {
               /// 🇺🇸 English: "In the end, this can only be answered by God, but we would like to ask all critics the following question: Are the prayers valid if you do not understand the meaning of your spoken words?"
               internal enum Answer {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.IPAD_READING.ANSWER" }
               }

               /// 🇺🇸 English: "Are the prayers valid at all, if I read or listen to a voice?"
               internal enum Question {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.IPAD_READING.QUESTION" }
               }
            }

            internal enum Language {
               /// 🇺🇸 English: "We are convinced that the Quran prescribes regular prayers above all to be aware of God and to remember his guidance. Words that can not be understood neither warn against the wrong path, nor show the right path which is, at the end, what the Quran aims to do.\n\nIn any case, we can not imagine that God wants us to merely admire the beauty of the sound of his lyrics five times a day. The Arabic in the Quran may be perfect and supreme in its meaning, but as long as the person doing the prayer has not mastered the Arabic language, his prayers in Arabic are imperfect. Moreover, we do not know a Quran verse which requires prayers to be done in Arabic."
               internal enum Answer {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.LANGUAGE.ANSWER" }
               }

               /// 🇺🇸 English: "Do prayers not have to be spoken in Arabic, the original language of the Koran?"
               internal enum Question {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.LANGUAGE.QUESTION" }
               }
            }

            internal enum TranslationProblem {
               /// 🇺🇸 English: "We understand that regular prayers are something so important that you want to do everything as correct as possible. We also understand that in religion many different opinions about the meaning of the same text prevail, and it is important that you remain as close as possible to the original text.\n\nThis is why we absolutely want you to read the Quran yourself, not the narratives and traditions of those who have studied the Quran for years and try to enlighten you (supposedly), and above all not those who try to teach you about \"the real message of the Koran\". We are convinced that one can make distinction only if one reads the Quran for oneself what this App tries to help with."
               internal enum Answer {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.ANSWER" }
               }

               /// 🇺🇸 English: "Do translations not necessarily change the meaning of the original text?"
               internal enum Question {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.QUESTION" }
               }
            }
         }

         internal enum Faq {
            /// 🇺🇸 English: "FAQ"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.FAQ.TITLE" }
            }
         }

         internal enum FeedbackButton {
            /// 🇺🇸 English: "Feedback"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.FEEDBACK_BUTTON.TITLE" }
            }
         }

         internal enum PrayerSection {
            internal enum AllowLongerRecitations {
               /// 🇺🇸 English: "Current position in split Surah was cleared."
               internal enum ResetMessage {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.PRAYER_SECTION.ALLOW_LONGER_RECITATIONS.RESET_MESSAGE" }
               }

               /// 🇺🇸 English: "Allow longer recitations"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.PRAYER_SECTION.ALLOW_LONGER_RECITATIONS.TITLE" }
               }
            }

            internal enum AllowSplittingRecitations {
               /// 🇺🇸 English: "Split & include long surah"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.PRAYER_SECTION.ALLOW_SPLITTING_RECITATIONS.TITLE" }
               }
            }

            internal enum ChangingTextName {
               /// 🇺🇸 English: "Show Quran sura name"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.PRAYER_SECTION.CHANGING_TEXT_NAME.TITLE" }
               }
            }

            /// 🇺🇸 English: "You can decide, if the name of the changing Quran recitation while standing should be displayed before showing its contents. You can also allow for up to four times longer Quran recitations while standing. Most Quranic surahs are even too long for that, to include them into your prayers, you have to allow splitting them – the app will remember the spliting position and continue from where you left off on the next prayer."
            internal enum Footer {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.PRAYER_SECTION.FOOTER" }
            }

            internal enum RakatCount {
               /// 🇺🇸 English: "Rakat count"
               internal enum Title {
                  /// The translated `String` instance.
                  internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

                  /// The SwiftUI `LocalizedStringKey` instance.
                  internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

                  /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
                  internal static var tableLookupKey: String { "SETTINGS.PRAYER_SECTION.RAKAT_COUNT.TITLE" }
               }
            }

            /// 🇺🇸 English: "Prayer Settings"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.PRAYER_SECTION.TITLE" }
            }
         }

         internal enum StartButton {
            /// 🇺🇸 English: "Start prayer"
            internal enum Title {
               /// The translated `String` instance.
               internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

               /// The SwiftUI `LocalizedStringKey` instance.
               internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

               /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
               internal static var tableLookupKey: String { "SETTINGS.START_BUTTON.TITLE" }
            }
         }

         /// 🇺🇸 English: "Settings"
         internal enum Title {
            /// The translated `String` instance.
            internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

            /// The SwiftUI `LocalizedStringKey` instance.
            internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

            /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
            internal static var tableLookupKey: String { "SETTINGS.TITLE" }
         }
      }

      internal enum SpeechSynthesizer {
         /// 🇺🇸 English: "Chapter "
         internal enum BookEmojiReplacement {
            /// The translated `String` instance.
            internal static var string: String { Bundle.main.localizedString(forKey: self.tableLookupKey, value: nil, table: "Localizable") }

            /// The SwiftUI `LocalizedStringKey` instance.
            internal static var locStringKey: LocalizedStringKey { LocalizedStringKey(self.tableLookupKey) }

            /// The lookup key in the translation table (= the key in the `.strings` or `.stringsdict` file).
            internal static var tableLookupKey: String { "SPEECH_SYNTHESIZER.BOOK_EMOJI_REPLACEMENT" }
         }
      }
   }
}
