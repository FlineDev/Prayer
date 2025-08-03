//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

class PrayerState {
   private let prayer: Prayer
   private let changingTextSpeedFactor: Double
   private let fixedTextsSpeedFactor: Double
   private let audioMode: AudioMode
   private let movementSoundInstrument: String
   private let speechSynthesizer: SpeechSynthesizer

   private var rakatIndex: Int = 0
   private var componentIndex: Int = 0
   private var lineIndex: Int = 0

   var previousArrow: Position.Arrow?
   var previousLine: String?

   private var previousPositon: Position = .standing
   private var currentPosition: Position = .standing

   init(
      prayer: Prayer,
      changingTextSpeedFactor: Double,
      fixedTextsSpeedFactor: Double,
      audioMode: AudioMode,
      movementSoundInstrument: String,
      speechSynthesizer: SpeechSynthesizer
   ) {
      self.prayer = prayer
      self.changingTextSpeedFactor = changingTextSpeedFactor
      self.fixedTextsSpeedFactor = fixedTextsSpeedFactor
      self.audioMode = audioMode
      self.movementSoundInstrument = movementSoundInstrument
      self.speechSynthesizer = speechSynthesizer
   }

   private var currentRakah: Rakah { self.prayer.rakat[self.rakatIndex] }
   private var currentComponent: RakahComponent { self.currentRakah.components()[self.componentIndex] }
   var currentArrow: Position.Arrow? { self.previousPositon.arrow(forChangingTo: self.currentPosition) }
   var currentLine: String { self.currentComponent.spokenTextLines[self.lineIndex] }

   private var readingSpeedupFactor: Double {
      self.currentComponent.isChangingText ? self.changingTextSpeedFactor : self.fixedTextsSpeedFactor
   }

   var currentLineReadingTime: TimeInterval {
      var readingTime = self.currentLine.estimatedReadingTime / self.readingSpeedupFactor

      if let movementDelay = movementDelay {
         readingTime += movementDelay
      }

      return readingTime
   }

   var movementDelay: TimeInterval? {
      guard self.lineIndex == 0, self.currentComponent.needsMovement else { return nil }
      return self.previousPositon.movementDuration(forChangingTo: self.currentPosition)
   }

   var currentMovementSoundUrl: URL? {
      guard self.lineIndex == 0, let movementSound = currentComponent.movementSound else { return nil }
      return AudioPlayer.shared.movementSoundUrl(name: movementSound.rawValue, instrument: self.movementSoundInstrument)
   }

   var currentRecitationChapterNum: Int? { self.currentComponent.chapterNumber }

   private var nextRakah: Rakah? {
      guard self.rakatIndex + 1 < self.prayer.rakat.count else { return nil }
      return self.prayer.rakat[self.rakatIndex + 1]
   }

   private var nextComponent: RakahComponent? {
      guard self.componentIndex + 1 < self.currentRakah.components().count else { return self.nextRakah?.components().first }
      return self.currentRakah.components()[self.componentIndex + 1]
   }

   var nextArrow: Position.Arrow? {
      guard self.lineIndex + 1 >= self.currentComponent.spokenTextLines.count else { return nil }
      return self.currentPosition.arrow(forChangingTo: self.nextComponent?.position)
   }

   var nextLine: String? {
      guard self.lineIndex + 1 < self.currentComponent.spokenTextLines.count else { return self.nextComponent?.spokenTextLines.first }
      return self.currentComponent.spokenTextLines[self.lineIndex + 1]
   }

   private var movementSoundUrl: URL? {
      guard self.lineIndex == 0 else { return nil }
      guard let movementSound = currentComponent.movementSound else { return nil }

      return AudioPlayer.shared.movementSoundUrl(name: movementSound.rawValue, instrument: self.movementSoundInstrument)
   }

   func moveToNextLine() -> Bool {
      self.previousLine = self.currentLine

      // update position
      self.previousPositon = self.currentPosition
      if self.lineIndex + 1 >= self.currentComponent.spokenTextLines.count {
         if let nextComponent = nextComponent {
            self.currentPosition = nextComponent.position
         }
      }

      guard self.lineIndex + 1 >= self.currentComponent.spokenTextLines.count else {
         self.lineIndex += 1
         return true
      }
      self.lineIndex = 0

      guard self.componentIndex + 1 >= self.currentRakah.components().count else {
         self.componentIndex += 1
         return true
      }
      self.componentIndex = 0

      guard self.rakatIndex + 1 >= self.prayer.rakat.count else {
         self.rakatIndex += 1
         return true
      }
      return false
   }

   func prayerViewModel() -> PrayerViewModel {
      PrayerViewModel(
         currentComponentName: self.currentComponent.name,
         previousArrow: self.previousArrow,
         previousLine: self.previousLine,
         currentArrow: self.currentArrow,
         currentLine: self.currentLine,
         currentIsComponentBeginning: self.lineIndex == 0,
         nextArrow: self.nextArrow,
         nextLine: self.nextLine,
         nextIsComponentBeginning: self.lineIndex + 1 == self.currentComponent.spokenTextLines.count
      )
   }
}
