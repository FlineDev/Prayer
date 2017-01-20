// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

// swiftlint:disable file_length
// swiftlint:disable line_length

// swiftlint:disable type_body_length
// swiftlint:disable nesting
// swiftlint:disable variable_name
// swiftlint:disable valid_docs

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
}

extension L10n {
  fileprivate static func tr(_ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:enable type_body_length
// swiftlint:enable nesting
// swiftlint:enable variable_name
// swiftlint:enable valid_docs
