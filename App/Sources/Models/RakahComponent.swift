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
         self.name = self.l10n.Takbir.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Takbir")
         self.needsMovement = true
         self.position = pos
         self.isChangingText = false
         self.chapterNumber = nil

         if longSitting {
            self.movementSound = .longSitting
         } else {
            switch pos {
            case .bending, .worship:
               self.movementSound = .downwards

            case .standing, .sitting:
               self.movementSound = .upwards

            default:
               self.movementSound = nil
            }
         }

      case .openingSupplication:
         self.name = self.l10n.OpeningSupplication.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Opening-Supplication")
         self.needsMovement = false
         self.position = .standing
         self.movementSound = nil
         self.isChangingText = false
         self.chapterNumber = nil

      case .taawwudh:
         self.name = self.l10n.Taawwudh.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Taawwudh")
         self.needsMovement = false
         self.position = .standing
         self.movementSound = nil
         self.isChangingText = false
         self.chapterNumber = nil

      case .recitationPart(let recitationPart, let showName):
         self.chapterNumber = recitationPart.recitation.rawValue

         var title = recitationPart.recitation.localizedTitle
         if recitationPart.totalParts > 1 {
            title = self.l10n.SplitRecitationTitle(title, recitationPart.part, recitationPart.totalParts).string
         }
         self.name = "\(String.recitationEmoji)\(self.chapterNumber!): \(title)"

         self.spokenTextLines = showName ? [self.name] + recitationPart.recitationLines() : recitationPart.recitationLines()
         self.needsMovement = false
         self.position = .standing
         self.movementSound = nil
         self.isChangingText = recitationPart.recitation != .theOpening

      case .ruku:
         self.name = self.l10n.Ruku.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Ruku")
         self.needsMovement = false
         self.position = .bending
         self.movementSound = nil
         self.isChangingText = false
         self.chapterNumber = nil

      case .straighteningUp:
         self.name = self.l10n.StraighteningUp.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Straightening-Up")
         self.needsMovement = true
         self.position = .standing
         self.movementSound = .upwards
         self.isChangingText = false
         self.chapterNumber = nil

      case .sajdah:
         self.name = self.l10n.Sajdah.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Sajdah")
         self.needsMovement = false
         self.position = .worship
         self.movementSound = nil
         self.isChangingText = false
         self.chapterNumber = nil

      case .tashahhud:
         self.name = self.l10n.Tashahhud.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Tashahhud")
         self.needsMovement = false
         self.position = .sitting
         self.movementSound = nil
         self.isChangingText = false
         self.chapterNumber = nil

      case .salatulIbrahimiyyah:
         self.name = self.l10n.SalatulIbrahimiyyah.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Salatul-Ibrahimiyyah")
         self.needsMovement = false
         self.position = .sitting
         self.movementSound = nil
         self.isChangingText = false
         self.chapterNumber = nil

      case .rabbanagh:
         self.name = self.l10n.Rabbanagh.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Rabbanagh")
         self.needsMovement = false
         self.position = .sitting
         self.movementSound = nil
         self.isChangingText = false
         self.chapterNumber = nil

      case .salam(let pos):
         self.name = self.l10n.Salam.Name.string
         self.spokenTextLines = RakahComponent.readLinesFromFile(named: "Salam")
         self.needsMovement = true
         self.movementSound = .salam
         self.isChangingText = false
         self.position = pos
         self.chapterNumber = nil
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
