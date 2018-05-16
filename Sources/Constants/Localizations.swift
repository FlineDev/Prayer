// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
// swiftlint:disable nesting
// swiftlint:disable variable_name
// swiftlint:disable valid_docs
// swiftlint:disable type_name

enum L10n {

  enum PrayerView {

    enum Countdown {
      /// Countdown
      static let name = L10n.tr("PRAYER_VIEW.COUNTDOWN.NAME")
    }
  }

  enum RakahComponent {

    enum OpeningSupplication {
      /// Opening Supplication
      static let name = L10n.tr("RAKAH_COMPONENT.OPENING_SUPPLICATION.NAME")
    }

    enum Rabbanagh {
      /// Rabbanagh
      static let name = L10n.tr("RAKAH_COMPONENT.RABBANAGH.NAME")
    }

    enum Ruku {
      /// Ruku
      static let name = L10n.tr("RAKAH_COMPONENT.RUKU.NAME")
    }

    enum Sajdah {
      /// Sajdah
      static let name = L10n.tr("RAKAH_COMPONENT.SAJDAH.NAME")
    }

    enum Salam {
      /// Salâm
      static let name = L10n.tr("RAKAH_COMPONENT.SALAM.NAME")
    }

    enum SalatulIbrahimiyyah {
      /// Salatul-'Ibrahimiyyah
      static let name = L10n.tr("RAKAH_COMPONENT.SALATUL_IBRAHIMIYYAH.NAME")
    }

    enum StraighteningUp {
      /// Straightening Up
      static let name = L10n.tr("RAKAH_COMPONENT.STRAIGHTENING_UP.NAME")
    }

    enum Taawwudh {
      /// Ta'awwudh
      static let name = L10n.tr("RAKAH_COMPONENT.TAAWWUDH.NAME")
    }

    enum Takbir {
      /// Takbīr
      static let name = L10n.tr("RAKAH_COMPONENT.TAKBIR.NAME")
    }

    enum Tashahhud {
      /// Tashahhud
      static let name = L10n.tr("RAKAH_COMPONENT.TASHAHHUD.NAME")
    }
  }

  enum Recitation {

    enum Assistance {
      /// Assistance
      static let name = L10n.tr("RECITATION.ASSISTANCE.NAME")
    }

    enum GoodInAbundance {
      /// Good in Abundance
      static let name = L10n.tr("RECITATION.GOOD_IN_ABUNDANCE.NAME")
    }

    enum Men {
      /// Men
      static let name = L10n.tr("RECITATION.MEN.NAME")
    }

    enum Quraysh {
      /// Quraysh
      static let name = L10n.tr("RECITATION.QURAYSH.NAME")
    }

    enum Succour {
      /// Succour
      static let name = L10n.tr("RECITATION.SUCCOUR.NAME")
    }

    enum TheDecleratiionOfGodsPerfection {
      /// The Decleration Of (God's) Perfection
      static let name = L10n.tr("RECITATION.THE_DECLERATIION_OF_GODS_PERFECTION.NAME")
    }

    enum TheElephant {
      /// The Elephant
      static let name = L10n.tr("RECITATION.THE_ELEPHANT.NAME")
    }

    enum TheFlightOfTime {
      /// The Flight Of Time
      static let name = L10n.tr("RECITATION.THE_FLIGHT_OF_TIME.NAME")
    }

    enum TheOpening {
      /// The Opening
      static let name = L10n.tr("RECITATION.THE_OPENING.NAME")
    }

    enum TheRisingDawn {
      /// The Rising Dawn
      static let name = L10n.tr("RECITATION.THE_RISING_DAWN.NAME")
    }

    enum TheSlanderer {
      /// The Slanderer
      static let name = L10n.tr("RECITATION.THE_SLANDERER.NAME")
    }

    enum TheTwistedStrands {
      /// The Twisted Strands
      static let name = L10n.tr("RECITATION.THE_TWISTED_STRANDS.NAME")
    }

    enum ThoseWhoDenyTheTruth {
      /// Those Who Deny The Truth
      static let name = L10n.tr("RECITATION.THOSE_WHO_DENY_THE_TRUTH.NAME")
    }
  }

  enum Settings {
    /// Settings
    static let title = L10n.tr("SETTINGS.TITLE")

    enum AppSection {
      /// App Settings
      static let title = L10n.tr("SETTINGS.APP_SECTION.TITLE")

      enum InterfaceLanguage {
        /// Interface language
        static let title = L10n.tr("SETTINGS.APP_SECTION.INTERFACE_LANGUAGE.TITLE")
      }
    }

    enum ChangeLanguageSheet {
      /// Choose language
      static let title = L10n.tr("SETTINGS.CHANGE_LANGUAGE_SHEET.TITLE")
    }

    enum ChangeMovementSoundSheet {
      /// Choose movement instrument
      static let title = L10n.tr("SETTINGS.CHANGE_MOVEMENT_SOUND_SHEET.TITLE")
    }

    enum ConfirmAlert {
      /// In order to change the language, the App must be closed and reopened by you.
      static let message = L10n.tr("SETTINGS.CONFIRM_ALERT.MESSAGE")
      /// App restart required
      static let title = L10n.tr("SETTINGS.CONFIRM_ALERT.TITLE")

      enum Action {
        /// Close now
        static let confirm = L10n.tr("SETTINGS.CONFIRM_ALERT.ACTION.CONFIRM")
        /// Later
        static let later = L10n.tr("SETTINGS.CONFIRM_ALERT.ACTION.LATER")
      }
    }

    enum Faq {
      /// FAQ
      static let title = L10n.tr("SETTINGS.FAQ.TITLE")
    }

    enum FaqButton {
      /// FAQ
      static let title = L10n.tr("SETTINGS.FAQ_BUTTON.TITLE")
    }

    enum FaqEntries {

      enum AppMotivation {
        /// This App currently has two goals:\n1. Becoming aware of what you are actually saying when you pray.\n2. Use the regular prayers to read the Quran.\n\nCurrently the app contains only the last twelve surahs of the Quran and randomly selects between them while one is staying during a prayer, but this is only the first step. With updates we are to follow all the missing surahs, and we also have a planned solution for longer surahs so that you can read them bit by bit to be able to pray and understand them without losing context.\n\nSpecifically NOT the purpose of this app is to teach praying from the ground up. Knowledge of the fundamentals of the prayers is already assumed, the app is intended primarily to move from doing your prayers in a foreign language (Arabic) to a language which you already mastered (currently: English, German and Turkish).
        static let answer = L10n.tr("SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.ANSWER")
        /// What is the purpose of this app?
        static let question = L10n.tr("SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.QUESTION")
      }

      enum IpadReading {
        /// In the end, this can only be answered by God, but we would like to ask all critics the following question: Are the prayers valid if you do not understand the meaning of your spoken words?
        static let answer = L10n.tr("SETTINGS.FAQ_ENTRIES.IPAD_READING.ANSWER")
        /// Are the prayers valid at all, if I read from the iPad?
        static let question = L10n.tr("SETTINGS.FAQ_ENTRIES.IPAD_READING.QUESTION")
      }

      enum Language {
        /// We are convinced that the Quran prescribes regular prayers above all to be aware of God and to remember his guidance. Words that can not be understood neither warn against the wrong path, nor show the right path which is, at the end, what the Quran aims to do.\n\nIn any case, we can not imagine that God wants us to merely admire the beauty of the sound of his lyrics five times a day. The Arabic in the Quran may be perfect and supreme in its meaning, but as long as the person doing the prayer has not mastered the Arabic language, his prayers in Arabic are imperfect. Moreover, we do not know a Quran verse which requires prayers to be done in Arabic.
        static let answer = L10n.tr("SETTINGS.FAQ_ENTRIES.LANGUAGE.ANSWER")
        /// Do prayers not have to be spoken in Arabic, the original language of the Koran?
        static let question = L10n.tr("SETTINGS.FAQ_ENTRIES.LANGUAGE.QUESTION")
      }

      enum LanguageMix {
        /// Actually this app is meant to be able to get away from the Arabic language, if you did not master it. An alternative usage method would be to use the app as a supplement to prayers in Arabic, in order to be able to read the meaning next to it. Because we are convinced that prayers are all about meaning, we advise against it to not make the prayers unnecessarily complicated, but for some, this may be the only acceptable way what we can understand. We recommend setting the "Changing text name" setting for this application method.
        static let answer = L10n.tr("SETTINGS.FAQ_ENTRIES.LANGUAGE_MIX.ANSWER")
        /// Can I also use the app if I want to continue to pray in Arabic?
        static let question = L10n.tr("SETTINGS.FAQ_ENTRIES.LANGUAGE_MIX.QUESTION")
      }

      enum TranslationProblem {
        /// We understand that regular prayers are something so important that you want to do everything as correct as possible. We also understand that in religion many different opinions about the meaning of the same text prevail, and it is important that you remain as close as possible to the original text.\n\nThis is why we absolutely want you to read the Quran yourself, not the narratives and traditions of those who have studied the Quran for years and try to enlighten you (supposedly), and above all not those who try to teach you about "the real message of the Koran". We are convinced that this distinction is only possible if you read the Quran for yourself what this App tries to help with.
        static let answer = L10n.tr("SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.ANSWER")
        /// Do translations not necessarily change the meaning of the original text?
        static let question = L10n.tr("SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.QUESTION")
      }
    }

    enum FeedbackButton {
      /// Send Feedback
      static let title = L10n.tr("SETTINGS.FEEDBACK_BUTTON.TITLE")
    }

    enum PrayerSection {
      /// Prayer Settings
      static let title = L10n.tr("SETTINGS.PRAYER_SECTION.TITLE")

      enum ChangingText {
        /// Changing text speed
        static let title = L10n.tr("SETTINGS.PRAYER_SECTION.CHANGING_TEXT.TITLE")
      }

      enum ChangingTextName {
        /// Changing text name
        static let title = L10n.tr("SETTINGS.PRAYER_SECTION.CHANGING_TEXT_NAME.TITLE")
      }

      enum FixedTexts {
        /// Fixed texts speed
        static let title = L10n.tr("SETTINGS.PRAYER_SECTION.FIXED_TEXTS.TITLE")
      }

      enum MovementSoundInstrument {
        /// Movement sound
        static let title = L10n.tr("SETTINGS.PRAYER_SECTION.MOVEMENT_SOUND_INSTRUMENT.TITLE")
      }

      enum RakatCount {
        /// Rakat count
        static let title = L10n.tr("SETTINGS.PRAYER_SECTION.RAKAT_COUNT.TITLE")
      }
    }

    enum StartButton {
      /// Start prayer
      static let title = L10n.tr("SETTINGS.START_BUTTON.TITLE")
    }
  }
}

extension L10n {
  fileprivate static func tr(_ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

// swiftlint:enable type_body_length
// swiftlint:enable nesting
// swiftlint:enable variable_name
// swiftlint:enable valid_docs
