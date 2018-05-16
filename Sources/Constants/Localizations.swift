// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum PrayerView {

    internal enum Countdown {
      /// Countdown
      internal static let name = L10n.tr("Localizable", "PRAYER_VIEW.COUNTDOWN.NAME")
    }
  }

  internal enum RakahComponent {

    internal enum OpeningSupplication {
      /// Opening Supplication
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.OPENING_SUPPLICATION.NAME")
    }

    internal enum Rabbanagh {
      /// Rabbanagh
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.RABBANAGH.NAME")
    }

    internal enum Ruku {
      /// Ruku
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.RUKU.NAME")
    }

    internal enum Sajdah {
      /// Sajdah
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.SAJDAH.NAME")
    }

    internal enum Salam {
      /// Salâm
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.SALAM.NAME")
    }

    internal enum SalatulIbrahimiyyah {
      /// Salatul-'Ibrahimiyyah
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.SALATUL_IBRAHIMIYYAH.NAME")
    }

    internal enum StraighteningUp {
      /// Straightening Up
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.STRAIGHTENING_UP.NAME")
    }

    internal enum Taawwudh {
      /// Ta'awwudh
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.TAAWWUDH.NAME")
    }

    internal enum Takbir {
      /// Takbīr
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.TAKBIR.NAME")
    }

    internal enum Tashahhud {
      /// Tashahhud
      internal static let name = L10n.tr("Localizable", "RAKAH_COMPONENT.TASHAHHUD.NAME")
    }
  }

  internal enum Recitation {

    internal enum Assistance {
      /// Assistance
      internal static let name = L10n.tr("Localizable", "RECITATION.ASSISTANCE.NAME")
    }

    internal enum GoodInAbundance {
      /// Good in Abundance
      internal static let name = L10n.tr("Localizable", "RECITATION.GOOD_IN_ABUNDANCE.NAME")
    }

    internal enum Men {
      /// Men
      internal static let name = L10n.tr("Localizable", "RECITATION.MEN.NAME")
    }

    internal enum Quraysh {
      /// Quraysh
      internal static let name = L10n.tr("Localizable", "RECITATION.QURAYSH.NAME")
    }

    internal enum Succour {
      /// Succour
      internal static let name = L10n.tr("Localizable", "RECITATION.SUCCOUR.NAME")
    }

    internal enum TheDecleratiionOfGodsPerfection {
      /// The Decleration Of (God's) Perfection
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_DECLERATIION_OF_GODS_PERFECTION.NAME")
    }

    internal enum TheElephant {
      /// The Elephant
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_ELEPHANT.NAME")
    }

    internal enum TheFlightOfTime {
      /// The Flight Of Time
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_FLIGHT_OF_TIME.NAME")
    }

    internal enum TheOpening {
      /// The Opening
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_OPENING.NAME")
    }

    internal enum TheRisingDawn {
      /// The Rising Dawn
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_RISING_DAWN.NAME")
    }

    internal enum TheSlanderer {
      /// The Slanderer
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_SLANDERER.NAME")
    }

    internal enum TheTwistedStrands {
      /// The Twisted Strands
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_TWISTED_STRANDS.NAME")
    }

    internal enum ThoseWhoDenyTheTruth {
      /// Those Who Deny The Truth
      internal static let name = L10n.tr("Localizable", "RECITATION.THOSE_WHO_DENY_THE_TRUTH.NAME")
    }
  }

  internal enum Settings {
    /// Settings
    internal static let title = L10n.tr("Localizable", "SETTINGS.TITLE")

    internal enum AppSection {
      /// App Settings
      internal static let title = L10n.tr("Localizable", "SETTINGS.APP_SECTION.TITLE")

      internal enum InterfaceLanguage {
        /// Interface language
        internal static let title = L10n.tr("Localizable", "SETTINGS.APP_SECTION.INTERFACE_LANGUAGE.TITLE")
      }
    }

    internal enum ChangeLanguageSheet {
      /// Choose language
      internal static let title = L10n.tr("Localizable", "SETTINGS.CHANGE_LANGUAGE_SHEET.TITLE")
    }

    internal enum ChangeMovementSoundSheet {
      /// Choose movement instrument
      internal static let title = L10n.tr("Localizable", "SETTINGS.CHANGE_MOVEMENT_SOUND_SHEET.TITLE")
    }

    internal enum ConfirmAlert {
      /// In order to change the language, the App must be closed and reopened by you.
      internal static let message = L10n.tr("Localizable", "SETTINGS.CONFIRM_ALERT.MESSAGE")
      /// App restart required
      internal static let title = L10n.tr("Localizable", "SETTINGS.CONFIRM_ALERT.TITLE")

      internal enum Action {
        /// Close now
        internal static let confirm = L10n.tr("Localizable", "SETTINGS.CONFIRM_ALERT.ACTION.CONFIRM")
        /// Later
        internal static let later = L10n.tr("Localizable", "SETTINGS.CONFIRM_ALERT.ACTION.LATER")
      }
    }

    internal enum Faq {
      /// FAQ
      internal static let title = L10n.tr("Localizable", "SETTINGS.FAQ.TITLE")
    }

    internal enum FaqButton {
      /// FAQ
      internal static let title = L10n.tr("Localizable", "SETTINGS.FAQ_BUTTON.TITLE")
    }

    internal enum FaqEntries {

      internal enum AppMotivation {
        /// This App currently has two goals:\n1. Becoming aware of what you are actually saying when you pray.\n2. Use the regular prayers to read the Quran.\n\nCurrently the app contains only the last twelve surahs of the Quran and randomly selects between them while one is staying during a prayer, but this is only the first step. With updates we are to follow all the missing surahs, and we also have a planned solution for longer surahs so that you can read them bit by bit to be able to pray and understand them without losing context.\n\nSpecifically NOT the purpose of this app is to teach praying from the ground up. Knowledge of the fundamentals of the prayers is already assumed, the app is intended primarily to move from doing your prayers in a foreign language (Arabic) to a language which you already mastered (currently: English, German and Turkish).
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.ANSWER")
        /// What is the purpose of this app?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.QUESTION")
      }

      internal enum IpadReading {
        /// In the end, this can only be answered by God, but we would like to ask all critics the following question: Are the prayers valid if you do not understand the meaning of your spoken words?
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.IPAD_READING.ANSWER")
        /// Are the prayers valid at all, if I read from the iPad?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.IPAD_READING.QUESTION")
      }

      internal enum Language {
        /// We are convinced that the Quran prescribes regular prayers above all to be aware of God and to remember his guidance. Words that can not be understood neither warn against the wrong path, nor show the right path which is, at the end, what the Quran aims to do.\n\nIn any case, we can not imagine that God wants us to merely admire the beauty of the sound of his lyrics five times a day. The Arabic in the Quran may be perfect and supreme in its meaning, but as long as the person doing the prayer has not mastered the Arabic language, his prayers in Arabic are imperfect. Moreover, we do not know a Quran verse which requires prayers to be done in Arabic.
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.LANGUAGE.ANSWER")
        /// Do prayers not have to be spoken in Arabic, the original language of the Koran?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.LANGUAGE.QUESTION")
      }

      internal enum LanguageMix {
        /// Actually this app is meant to be able to get away from the Arabic language, if you did not master it. An alternative usage method would be to use the app as a supplement to prayers in Arabic, in order to be able to read the meaning next to it. Because we are convinced that prayers are all about meaning, we advise against it to not make the prayers unnecessarily complicated, but for some, this may be the only acceptable way what we can understand. We recommend setting the "Changing text name" setting for this application method.
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.LANGUAGE_MIX.ANSWER")
        /// Can I also use the app if I want to continue to pray in Arabic?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.LANGUAGE_MIX.QUESTION")
      }

      internal enum TranslationProblem {
        /// We understand that regular prayers are something so important that you want to do everything as correct as possible. We also understand that in religion many different opinions about the meaning of the same text prevail, and it is important that you remain as close as possible to the original text.\n\nThis is why we absolutely want you to read the Quran yourself, not the narratives and traditions of those who have studied the Quran for years and try to enlighten you (supposedly), and above all not those who try to teach you about "the real message of the Koran". We are convinced that this distinction is only possible if you read the Quran for yourself what this App tries to help with.
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.ANSWER")
        /// Do translations not necessarily change the meaning of the original text?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.QUESTION")
      }
    }

    internal enum FeedbackButton {
      /// Send Feedback
      internal static let title = L10n.tr("Localizable", "SETTINGS.FEEDBACK_BUTTON.TITLE")
    }

    internal enum PrayerSection {
      /// Prayer Settings
      internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.TITLE")

      internal enum ChangingText {
        /// Changing text speed
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.CHANGING_TEXT.TITLE")
      }

      internal enum ChangingTextName {
        /// Changing text name
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.CHANGING_TEXT_NAME.TITLE")
      }

      internal enum FixedTexts {
        /// Fixed texts speed
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.FIXED_TEXTS.TITLE")
      }

      internal enum MovementSoundInstrument {
        /// Movement sound
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.MOVEMENT_SOUND_INSTRUMENT.TITLE")
      }

      internal enum RakatCount {
        /// Rakat count
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.RAKAT_COUNT.TITLE")
      }
    }

    internal enum StartButton {
      /// Start prayer
      internal static let title = L10n.tr("Localizable", "SETTINGS.START_BUTTON.TITLE")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
