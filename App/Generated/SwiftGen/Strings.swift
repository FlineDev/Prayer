// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum AudioMode {
    /// Sound for position changes
    internal static let movementSound = L10n.tr("Localizable", "AUDIO_MODE.MOVEMENT_SOUND")
    /// Both (sound + voice)
    internal static let movementSoundAndSpeechSynthesizer = L10n.tr("Localizable", "AUDIO_MODE.MOVEMENT_SOUND_AND_SPEECH_SYNTHESIZER")
    /// No audio (muted)
    internal static let `none` = L10n.tr("Localizable", "AUDIO_MODE.NONE")
    /// Reading computer voice
    internal static let speechSynthesizer = L10n.tr("Localizable", "AUDIO_MODE.SPEECH_SYNTHESIZER")
  }

  internal enum PrayerView {
    internal enum Countdown {
      /// Countdown
      internal static let name = L10n.tr("Localizable", "PRAYER_VIEW.COUNTDOWN.NAME")
    }
  }

  internal enum RakahComponent {
    /// %1$@ – part %2$d of %3$d
    internal static func splitRecitationTitle(_ p1: Any, _ p2: Int, _ p3: Int) -> String {
      return L10n.tr("Localizable", "RAKAH_COMPONENT.SPLIT_RECITATION_TITLE", String(describing: p1), p2, p3)
    }
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
      /// al-Ma'Un (Assistance)
      internal static let name = L10n.tr("Localizable", "RECITATION.ASSISTANCE.NAME")
    }
    internal enum Destiny {
      /// Al-Qadr (Destiny)
      internal static let name = L10n.tr("Localizable", "RECITATION.DESTINY.NAME")
    }
    internal enum Divorce {
      /// At-Talaq (Divorce)
      internal static let name = L10n.tr("Localizable", "RECITATION.DIVORCE.NAME")
    }
    internal enum Dominion {
      /// Al-Mulk (Dominion)
      internal static let name = L10n.tr("Localizable", "RECITATION.DOMINION.NAME")
    }
    internal enum GoodInAbundance {
      /// al-Kawthar (Good in Abundance)
      internal static let name = L10n.tr("Localizable", "RECITATION.GOOD_IN_ABUNDANCE.NAME")
    }
    internal enum GreedForMoreAndMore {
      /// At-Takathur (Greed For More And More)
      internal static let name = L10n.tr("Localizable", "RECITATION.GREED_FOR_MORE_AND_MORE.NAME")
    }
    internal enum HeFrowned {
      /// 'Abasa (He Frowned)
      internal static let name = L10n.tr("Localizable", "RECITATION.HE_FROWNED.NAME")
    }
    internal enum Iron {
      /// Al-Hadid (Iron)
      internal static let name = L10n.tr("Localizable", "RECITATION.IRON.NAME")
    }
    internal enum LossAndGain {
      /// At-Taghabun (Loss And Gain)
      internal static let name = L10n.tr("Localizable", "RECITATION.LOSS_AND_GAIN.NAME")
    }
    internal enum Man {
      /// Al-Insan (Man)
      internal static let name = L10n.tr("Localizable", "RECITATION.MAN.NAME")
    }
    internal enum Men {
      /// an-Nas (Men)
      internal static let name = L10n.tr("Localizable", "RECITATION.MEN.NAME")
    }
    internal enum Noah {
      /// Nuh (Noah)
      internal static let name = L10n.tr("Localizable", "RECITATION.NOAH.NAME")
    }
    internal enum Prohibition {
      /// At-Tahrim (Prohibition)
      internal static let name = L10n.tr("Localizable", "RECITATION.PROHIBITION.NAME")
    }
    internal enum Quraysh {
      /// Quraysch
      internal static let name = L10n.tr("Localizable", "RECITATION.QURAYSH.NAME")
    }
    internal enum Resurrection {
      /// Al-Qiyamah (Resurrection)
      internal static let name = L10n.tr("Localizable", "RECITATION.RESURRECTION.NAME")
    }
    internal enum ShroudingInDarkness {
      /// At-Takwir (Shrouding In Darkness)
      internal static let name = L10n.tr("Localizable", "RECITATION.SHROUDING_IN_DARKNESS.NAME")
    }
    internal enum Succour {
      /// an-Nasr (Succour)
      internal static let name = L10n.tr("Localizable", "RECITATION.SUCCOUR.NAME")
    }
    internal enum ThatWhichComesInTheNight {
      /// At-Tariq (That Which Comes In The Night)
      internal static let name = L10n.tr("Localizable", "RECITATION.THAT_WHICH_COMES_IN_THE_NIGHT.NAME")
    }
    internal enum ThatWhichMustComeToPass {
      /// Al-Waqiah (That Which Must Come To Pass)
      internal static let name = L10n.tr("Localizable", "RECITATION.THAT_WHICH_MUST_COME_TO_PASS.NAME")
    }
    internal enum TheAllHighest {
      /// Al-A'La (The All-Highest)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_ALL_HIGHEST.NAME")
    }
    internal enum TheBrightMorningHours {
      /// Ad-Duha (The Bright Morning Hours)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_BRIGHT_MORNING_HOURS.NAME")
    }
    internal enum TheChargers {
      /// Al-Adiyat (The Chargers)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_CHARGERS.NAME")
    }
    internal enum TheCleavingAsunder {
      /// Al-Infitar (The Cleaving Asunder)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_CLEAVING_ASUNDER.NAME")
    }
    internal enum TheCongregation {
      /// Al-Jumu'ah (The Congregation)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_CONGREGATION.NAME")
    }
    internal enum TheDaybreak {
      /// Al-Fajr (The Daybreak)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_DAYBREAK.NAME")
    }
    internal enum TheDecleratiionOfGodsPerfection {
      /// al-Ikhlas (The Decleration Of [God's] Perfection)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_DECLERATIION_OF_GODS_PERFECTION.NAME")
    }
    internal enum TheEarthquake {
      /// Al-Zalzalah (The Earthquake)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_EARTHQUAKE.NAME")
    }
    internal enum TheElephant {
      /// al-Fil (The Elephant)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_ELEPHANT.NAME")
    }
    internal enum TheEnfoldedOne {
      /// Al-Muddaththir (The Enfolded One)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_ENFOLDED_ONE.NAME")
    }
    internal enum TheEnwrappedOne {
      /// Al-Muzzammil (The Enwrapped One)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_ENWRAPPED_ONE.NAME")
    }
    internal enum TheEvidenceOfTheTruth {
      /// Al-Bayyinah (The Evidence Of The Truth)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_EVIDENCE_OF_THE_TRUTH.NAME")
    }
    internal enum TheExaminedOne {
      /// Al-Mumtahanah (The Examined One)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_EXAMINED_ONE.NAME")
    }
    internal enum TheFig {
      /// At-Tin (The Fig)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_FIG.NAME")
    }
    internal enum TheFlightOfTime {
      /// al-'Asr (The Flight Of Time)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_FLIGHT_OF_TIME.NAME")
    }
    internal enum TheGathering {
      /// Al-Hashr (The Gathering)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_GATHERING.NAME")
    }
    internal enum TheGermCell {
      /// Al-Alaq (The Germ-Cell)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_GERM_CELL.NAME")
    }
    internal enum TheGreatConstellations {
      /// Al-Buruj (The Great Constellations)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_GREAT_CONSTELLATIONS.NAME")
    }
    internal enum TheHypocrites {
      /// Al-Munafiqun (The Hypocrites)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_HYPOCRITES.NAME")
    }
    internal enum TheLand {
      /// Al-Balad (The Land)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_LAND.NAME")
    }
    internal enum TheLayingBareOfTheTruth {
      /// Al-Haqqah (The Laying-Bare Of The Truth)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_LAYING_BARE_OF_THE_TRUTH.NAME")
    }
    internal enum TheMostGracious {
      /// Ar-Rahman (The Most Gracious)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_MOST_GRACIOUS.NAME")
    }
    internal enum TheNight {
      /// Al-Layl (The Night)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_NIGHT.NAME")
    }
    internal enum TheOpening {
      /// al-Fatiha (The Opening)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_OPENING.NAME")
    }
    internal enum TheOpeningUpOfTheHeart {
      /// Ash-Sharh (The Opening-Up Of The Heart)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_OPENING_UP_OF_THE_HEART.NAME")
    }
    internal enum TheOvershadowingEvent {
      /// Al-Ghashiyah (The Overshadowing Event)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_OVERSHADOWING_EVENT.NAME")
    }
    internal enum ThePen {
      /// Al-Qalam (The Pen)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_PEN.NAME")
    }
    internal enum ThePleading {
      /// Al-Mujadalah (The Pleading)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_PLEADING.NAME")
    }
    internal enum TheRanks {
      /// As-Saff (The Ranks)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_RANKS.NAME")
    }
    internal enum TheRisingDawn {
      /// al-Falaq (The Rising Dawn)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_RISING_DAWN.NAME")
    }
    internal enum TheSlanderer {
      /// al-Humaza (The Slanderer)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_SLANDERER.NAME")
    }
    internal enum TheSplittingAsunder {
      /// Al-Inshiqaq (The Splitting Asunder)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_SPLITTING_ASUNDER.NAME")
    }
    internal enum TheSuddenCalamity {
      /// Al-Qariah (The Sudden Calamity)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_SUDDEN_CALAMITY.NAME")
    }
    internal enum TheSun {
      /// Ash-Shams (The Sun)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_SUN.NAME")
    }
    internal enum TheTiding {
      /// An-Naba (The Tiding)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_TIDING.NAME")
    }
    internal enum TheTwistedStrands {
      /// al-Masad (The Twisted Strands)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_TWISTED_STRANDS.NAME")
    }
    internal enum TheUnseenBeings {
      /// Al-Jinn (The Unseen Beings)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_UNSEEN_BEINGS.NAME")
    }
    internal enum TheWaysOfAscent {
      /// Al-Ma'Arij (The Ways Of Ascent)
      internal static let name = L10n.tr("Localizable", "RECITATION.THE_WAYS_OF_ASCENT.NAME")
    }
    internal enum ThoseSentForth {
      /// Al-Mursalat (Those Sent Forth)
      internal static let name = L10n.tr("Localizable", "RECITATION.THOSE_SENT_FORTH.NAME")
    }
    internal enum ThoseThatRise {
      /// An-Nazi'at (Those That Rise)
      internal static let name = L10n.tr("Localizable", "RECITATION.THOSE_THAT_RISE.NAME")
    }
    internal enum ThoseWhoDenyTheTruth {
      /// al-Kafirun (Those Who Deny The Truth)
      internal static let name = L10n.tr("Localizable", "RECITATION.THOSE_WHO_DENY_THE_TRUTH.NAME")
    }
    internal enum ThoseWhoGiveShortMeasure {
      /// Al-Mutaffifin (Those Who Give Short Measure)
      internal static let name = L10n.tr("Localizable", "RECITATION.THOSE_WHO_GIVE_SHORT_MEASURE.NAME")
    }
  }

  internal enum Settings {
    /// Settings
    internal static let title = L10n.tr("Localizable", "SETTINGS.TITLE")
    internal enum AppSection {
      /// The language of the app determines the language of the texts shown during a prayer. Apple provides an app-specific language setting in the Settings app. Please use it to change the language of this app and the prayers.
      internal static let footer = L10n.tr("Localizable", "SETTINGS.APP_SECTION.FOOTER")
      /// App Settings
      internal static let title = L10n.tr("Localizable", "SETTINGS.APP_SECTION.TITLE")
      internal enum ChangeLanguageButton {
        /// Change language in ⚙️ Settings
        internal static let title = L10n.tr("Localizable", "SETTINGS.APP_SECTION.CHANGE_LANGUAGE_BUTTON.TITLE")
      }
    }
    internal enum Audio {
      internal enum OutputDevice {
        /// Select output device (via AirPlay icon):
        internal static let title = L10n.tr("Localizable", "SETTINGS.AUDIO.OUTPUT_DEVICE.TITLE")
      }
      internal enum SpeechSynthesizer {
        /// Pitch multiplicator
        internal static let pitchMultiplier = L10n.tr("Localizable", "SETTINGS.AUDIO.SPEECH_SYNTHESIZER.PITCH_MULTIPLIER")
        /// Speech rate
        internal static let speechRate = L10n.tr("Localizable", "SETTINGS.AUDIO.SPEECH_SYNTHESIZER.SPEECH_RATE")
        /// Voice
        internal static let voice = L10n.tr("Localizable", "SETTINGS.AUDIO.SPEECH_SYNTHESIZER.VOICE")
      }
    }
    internal enum AudioSpeedSection {
      /// Choose one of the two available audio modes, or both or none. The first only plays a short sound when changing positions during a prayer. The second will instead read out loud the full prayer text so you can just listen. This also works when the device is locked in your pocket. This can for example be useful when you want to do your prayers in your preferred language without others in the same Prayer room noticing it.
      internal static let footer = L10n.tr("Localizable", "SETTINGS.AUDIO_SPEED_SECTION.FOOTER")
      /// Audio & Speed Settings
      internal static let title = L10n.tr("Localizable", "SETTINGS.AUDIO_SPEED_SECTION.TITLE")
      internal enum AudioMode {
        /// Audio Mode
        internal static let title = L10n.tr("Localizable", "SETTINGS.AUDIO_SPEED_SECTION.AUDIO_MODE.TITLE")
      }
      internal enum ChangingText {
        /// Quran sura speed
        internal static let title = L10n.tr("Localizable", "SETTINGS.AUDIO_SPEED_SECTION.CHANGING_TEXT.TITLE")
      }
      internal enum FixedTexts {
        /// Other texts speed
        internal static let title = L10n.tr("Localizable", "SETTINGS.AUDIO_SPEED_SECTION.FIXED_TEXTS.TITLE")
      }
      internal enum MovementSoundInstrument {
        /// Movement sound
        internal static let title = L10n.tr("Localizable", "SETTINGS.AUDIO_SPEED_SECTION.MOVEMENT_SOUND_INSTRUMENT.TITLE")
      }
    }
    internal enum ChangeMovementSoundSheet {
      /// Choose movement instrument
      internal static let title = L10n.tr("Localizable", "SETTINGS.CHANGE_MOVEMENT_SOUND_SHEET.TITLE")
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
        /// This App currently has two goals:
        /// 1. Becoming aware of what you are actually saying when you pray.
        /// 2. Use the regular prayers to read the Quran.
        /// 
        /// Currently the app contains only the last 60 surahs of the Quran and randomly selects between them while one is staying during a prayer, but this is only the first step. With updates we are to follow all the missing surahs, and we also have a solution for longer surahs so that you can read them bit by bit to be able to pray and understand them without losing context.
        /// 
        /// Specifically NOT the purpose of this app is to teach praying from the ground up. Knowledge of the fundamentals of the prayers is already assumed, the app is intended primarily to move from doing your prayers in a foreign language (Arabic) to a language which you already mastered (currently: English, German and Turkish).
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.ANSWER")
        /// What is the purpose of this app?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.APP_MOTIVATION.QUESTION")
      }
      internal enum IpadReading {
        /// In the end, this can only be answered by God, but we would like to ask all critics the following question: Are the prayers valid if you do not understand the meaning of your spoken words?
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.IPAD_READING.ANSWER")
        /// Are the prayers valid at all, if I read or listen to a voice?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.IPAD_READING.QUESTION")
      }
      internal enum Language {
        /// We are convinced that the Quran prescribes regular prayers above all to be aware of God and to remember his guidance. Words that can not be understood neither warn against the wrong path, nor show the right path which is, at the end, what the Quran aims to do.
        /// 
        /// In any case, we can not imagine that God wants us to merely admire the beauty of the sound of his lyrics five times a day. The Arabic in the Quran may be perfect and supreme in its meaning, but as long as the person doing the prayer has not mastered the Arabic language, his prayers in Arabic are imperfect. Moreover, we do not know a Quran verse which requires prayers to be done in Arabic.
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.LANGUAGE.ANSWER")
        /// Do prayers not have to be spoken in Arabic, the original language of the Koran?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.LANGUAGE.QUESTION")
      }
      internal enum TranslationProblem {
        /// We understand that regular prayers are something so important that you want to do everything as correct as possible. We also understand that in religion many different opinions about the meaning of the same text prevail, and it is important that you remain as close as possible to the original text.
        /// 
        /// This is why we absolutely want you to read the Quran yourself, not the narratives and traditions of those who have studied the Quran for years and try to enlighten you (supposedly), and above all not those who try to teach you about "the real message of the Koran". We are convinced that one can make distinction only if one reads the Quran for oneself what this App tries to help with.
        internal static let answer = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.ANSWER")
        /// Do translations not necessarily change the meaning of the original text?
        internal static let question = L10n.tr("Localizable", "SETTINGS.FAQ_ENTRIES.TRANSLATION_PROBLEM.QUESTION")
      }
    }
    internal enum FeedbackButton {
      /// Feedback
      internal static let title = L10n.tr("Localizable", "SETTINGS.FEEDBACK_BUTTON.TITLE")
    }
    internal enum PrayerSection {
      /// You can decide, if the name of the changing Quran recitation while standing should be displayed before showing its contents. You can also allow for up to four times longer Quran recitations while standing. Most Quranic surahs are even too long for that, to include them into your prayers, you have to allow splitting them – the app will remember the spliting position and continue from where you left off on the next prayer.
      internal static let footer = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.FOOTER")
      /// Prayer Settings
      internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.TITLE")
      internal enum AllowLongerRecitations {
        /// Current position in split Surah was cleared.
        internal static let resetMessage = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.ALLOW_LONGER_RECITATIONS.RESET_MESSAGE")
        /// Allow longer recitations
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.ALLOW_LONGER_RECITATIONS.TITLE")
      }
      internal enum AllowSplittingRecitations {
        /// Split & include lon surah
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.ALLOW_SPLITTING_RECITATIONS.TITLE")
      }
      internal enum ChangingTextName {
        /// Show Quran sura name
        internal static let title = L10n.tr("Localizable", "SETTINGS.PRAYER_SECTION.CHANGING_TEXT_NAME.TITLE")
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

  internal enum SpeechSynthesizer {
    /// Chapter 
    internal static let bookEmojiReplacement = L10n.tr("Localizable", "SPEECH_SYNTHESIZER.BOOK_EMOJI_REPLACEMENT")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
