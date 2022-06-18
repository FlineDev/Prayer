//
//  Created by Cihat Gündüz on 10.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import HandySwift
import UIKit

typealias Duration = DispatchTimeInterval

/// A single unit a rakah can consists of.
class RakahComponent {
   static let durationPerCharacter = Timespan.milliseconds(55)

   static var movementSoundInstrument: String {
      get {
         guard let instrument = UserDefaults.standard.string(forKey: "MovementSoundInstrument") else {
            return "Grand Piano with Pad & Choir"
         }
         return instrument
      }

      set {
         UserDefaults.standard.set(newValue, forKey: "MovementSoundInstrument")
         UserDefaults.standard.synchronize()
      }
   }

   let name: String
   let chapterNumber: Int?
   let spokenTextLines: [String]
   let needsMovement: Bool
   let position: Position
   let movementSound: MovementSound?
   let isChangingText: Bool

   let l10n = L10n.RakahComponent.self

   init(
      _ component: Rakah.Component,
      longSitting: Bool = false
   ) {
      switch component {
      case .takbir(let pos):
         name = l10n.Takbir.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Takbir")
         needsMovement = true
         position = pos
         isChangingText = false
         chapterNumber = nil

         if longSitting {
            movementSound = .longSitting
         } else {
            switch pos {
            case .bending, .worship:
               movementSound = .downwards

            case .standing, .sitting:
               movementSound = .upwards

            default:
               movementSound = nil
            }
         }

      case .openingSupplication:
         name = l10n.OpeningSupplication.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Opening-Supplication")
         needsMovement = false
         position = .standing
         movementSound = nil
         isChangingText = false
         chapterNumber = nil

      case .taawwudh:
         name = l10n.Taawwudh.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Taawwudh")
         needsMovement = false
         position = .standing
         movementSound = nil
         isChangingText = false
         chapterNumber = nil

      case .recitationPart(let recitationPart, let showName):
         chapterNumber = recitationPart.recitation.rawValue

         var title = recitationPart.recitation.localizedTitle
         if recitationPart.totalParts > 1 {
            title = l10n.SplitRecitationTitle(title, recitationPart.part, recitationPart.totalParts).string
         }
         name = "\(String.recitationEmoji)\(chapterNumber!): \(title)"

         spokenTextLines = showName ? [name] + recitationPart.recitationLines() : recitationPart.recitationLines()
         needsMovement = false
         position = .standing
         movementSound = nil
         isChangingText = recitationPart.recitation != .theOpening

      case .ruku:
         name = l10n.Ruku.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Ruku")
         needsMovement = false
         position = .bending
         movementSound = nil
         isChangingText = false
         chapterNumber = nil

      case .straighteningUp:
         name = l10n.StraighteningUp.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Straightening-Up")
         needsMovement = true
         position = .standing
         movementSound = .upwards
         isChangingText = false
         chapterNumber = nil

      case .sajdah:
         name = l10n.Sajdah.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Sajdah")
         needsMovement = false
         position = .worship
         movementSound = nil
         isChangingText = false
         chapterNumber = nil

      case .tashahhud:
         name = l10n.Tashahhud.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Tashahhud")
         needsMovement = false
         position = .sitting
         movementSound = nil
         isChangingText = false
         chapterNumber = nil

      case .salatulIbrahimiyyah:
         name = l10n.SalatulIbrahimiyyah.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Salatul-Ibrahimiyyah")
         needsMovement = false
         position = .sitting
         movementSound = nil
         isChangingText = false
         chapterNumber = nil

      case .rabbanagh:
         name = l10n.Rabbanagh.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Rabbanagh")
         needsMovement = false
         position = .sitting
         movementSound = nil
         isChangingText = false
         chapterNumber = nil

      case .salam(let pos):
         name = l10n.Salam.Name.string
         spokenTextLines = RakahComponent.readLinesFromFile(named: "Salam")
         needsMovement = true
         movementSound = .salam
         isChangingText = false
         position = pos
         chapterNumber = nil
      }
   }

   private static func readLinesFromFile(named name: String) -> [String] {
      let spokenTextFilePath = Bundle.main.url(forResource: name, withExtension: "txt")!
      let contentString = try! String(contentsOf: spokenTextFilePath, encoding: .utf8)
      return contentString.stripped().components(separatedBy: .newlines)
   }
}

extension String {
   static var recitationEmoji: Character = "📖"

   var estimatedReadingTime: Timespan {
      // 500 ms for context switch + 1s remember time for recitation name
      RakahComponent.durationPerCharacter * Double(utf8.count) + .milliseconds(500) + .seconds(contains(Self.recitationEmoji) ? 1 : 0)
   }
}
