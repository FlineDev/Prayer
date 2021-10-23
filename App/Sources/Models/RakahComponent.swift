//
//  Created by Cihat Gündüz on 10.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandySwift
import UIKit

typealias Duration = DispatchTimeInterval

/// A single unit a rakah can consists of.
class RakahComponent {
  // MARK: - Stored Type Properties
  static let durationPerCharacter = Timespan.milliseconds(55)

  // MARK: - Computed Type Properties
  static var movementSoundInstrument: String {
    get {
      guard let instrument = UserDefaults.standard.string(forKey: "MovementSoundInstrument") else {
        return "Baroque Organ"
      }
      return instrument
    }

    set {
      UserDefaults.standard.set(newValue, forKey: "MovementSoundInstrument")
      UserDefaults.standard.synchronize()
    }
  }

  // MARK: - Stored Instance Properties
  let name: String
  let chapterNumber: Int?
  let spokenTextLines: [String]
  let needsMovement: Bool
  let position: Position
  let movementSound: String?
  let isChangingText: Bool

  let l10n = L10n.RakahComponent.self

  // MARK: - Initializers
  init(
    _ component: Rakah.Component,
    longSitting: Bool = false
  ) {
    switch component {
    case let .takbir(pos):
      name = l10n.Takbir.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Takbir")
      needsMovement = true
      position = pos
      isChangingText = false
      chapterNumber = nil

      if longSitting {
        movementSound = "E-Long"
      }
      else {
        switch pos {
        case .bending, .worship:
          movementSound = "C-Short"

        case .standing, .sitting:
          movementSound = "E-Short"

        default:
          movementSound = nil
        }
      }

    case .openingSupplication:
      name = l10n.OpeningSupplication.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Opening-Supplication")
      needsMovement = false
      position = .standing
      movementSound = nil
      isChangingText = false
      chapterNumber = nil

    case .taawwudh:
      name = l10n.Taawwudh.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Taawwudh")
      needsMovement = false
      position = .standing
      movementSound = nil
      isChangingText = false
      chapterNumber = nil

    case let .recitationPart(recitationPart):
      chapterNumber = recitationPart.recitation.rawValue

      var title = recitationPart.recitation.localizedTitle
      if recitationPart.totalParts > 1 {
        title = l10n.splitRecitationTitle(title, recitationPart.part, recitationPart.totalParts)
      }
      name = "📖\(chapterNumber!): \(title)"

      spokenTextLines = RakahComponent.readLinesFromRecitationFile(recitationPart: recitationPart)
      needsMovement = false
      position = .standing
      movementSound = nil
      isChangingText = recitationPart.recitation != .theOpening

    case .ruku:
      name = l10n.Ruku.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Ruku")
      needsMovement = false
      position = .bending
      movementSound = nil
      isChangingText = false
      chapterNumber = nil

    case .straighteningUp:
      name = l10n.StraighteningUp.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Straightening-Up")
      needsMovement = true
      position = .standing
      movementSound = "E-Short"
      isChangingText = false
      chapterNumber = nil

    case .sajdah:
      name = l10n.Sajdah.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Sajdah")
      needsMovement = false
      position = .worship
      movementSound = nil
      isChangingText = false
      chapterNumber = nil

    case .tashahhud:
      name = l10n.Tashahhud.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Tashahhud")
      needsMovement = false
      position = .sitting
      movementSound = nil
      isChangingText = false
      chapterNumber = nil

    case .salatulIbrahimiyyah:
      name = l10n.SalatulIbrahimiyyah.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Salatul-Ibrahimiyyah")
      needsMovement = false
      position = .sitting
      movementSound = nil
      isChangingText = false
      chapterNumber = nil

    case .rabbanagh:
      name = l10n.Rabbanagh.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Rabbanagh")
      needsMovement = false
      position = .sitting
      movementSound = nil
      isChangingText = false
      chapterNumber = nil

    case let .salam(pos):
      name = l10n.Salam.name
      spokenTextLines = RakahComponent.readLinesFromFile(named: "Salam")
      needsMovement = true
      movementSound = "G-Short"
      isChangingText = false
      position = pos
      chapterNumber = nil
    }
  }

  // MARK: - Type Methods
  private static func readLinesFromFile(named name: String) -> [String] {
    let spokenTextFilePath = Bundle.main.url(forResource: name, withExtension: "txt")!
    let contentString = try! String(contentsOf: spokenTextFilePath, encoding: .utf8)
    return contentString.stripped().components(separatedBy: .newlines)
  }

  private static func readLinesFromRecitationFile(recitationPart: RecitationPart) -> [String] {
    let spokenTextFilePath = Bundle.main.url(forResource: recitationPart.recitation.fileName, withExtension: "txt")!
    var contentString = try! String(contentsOf: spokenTextFilePath, encoding: .utf8)

    if recitationPart.totalParts > 1 {
      let indexLowerBound = (recitationPart.part - 1) * recitationPart.partLength.factor
      let indexUpperBound = recitationPart.part * recitationPart.partLength.factor
      let partIndexRange = indexLowerBound..<indexUpperBound
      contentString = contentString.components(separatedBy: Recitation.splitSeparator)[partIndexRange].joined()
    }

    return contentString.components(separatedBy: .newlines)
      .filter { !$0.replacingOccurrences(of: Recitation.splitSeparator, with: "").isBlank }
  }
}

// MARK: - Sub Types
extension String {
  var estimatedReadingTime: Timespan {
    RakahComponent.durationPerCharacter * Double(utf8.count) + .milliseconds(500)  // add time for context switch
  }
}
