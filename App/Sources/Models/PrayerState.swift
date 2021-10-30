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

  private var currentRakah: Rakah { prayer.rakat[rakatIndex] }
  private var currentComponent: RakahComponent { currentRakah.components()[componentIndex] }
  var currentArrow: Position.Arrow? { previousPositon.arrow(forChangingTo: currentPosition) }
  var currentLine: String { currentComponent.spokenTextLines[lineIndex] }

  private var readingSpeedupFactor: Double {
    currentComponent.isChangingText ? changingTextSpeedFactor : fixedTextsSpeedFactor
  }

  var currentLineReadingTime: TimeInterval {
    var readingTime = currentLine.estimatedReadingTime / readingSpeedupFactor

    if let movementDelay = movementDelay {
      readingTime += movementDelay
    }

    return readingTime
  }

  var movementDelay: TimeInterval? {
    guard lineIndex == 0 && currentComponent.needsMovement else { return nil }
    return previousPositon.movementDuration(forChangingTo: currentPosition)
  }

  var currentMovementSoundUrl: URL? {
    guard let movementSound = currentComponent.movementSound else { return nil }
    return AudioPlayer.shared.movementSoundUrl(name: movementSound, instrument: movementSoundInstrument)
  }

  var currentRecitationChapterNum: Int? { return currentComponent.chapterNumber }

  private var nextRakah: Rakah? {
    guard rakatIndex + 1 < prayer.rakat.count else { return nil }
    return prayer.rakat[rakatIndex + 1]
  }

  private var nextComponent: RakahComponent? {
    guard componentIndex + 1 < currentRakah.components().count else { return nextRakah?.components().first }
    return currentRakah.components()[componentIndex + 1]
  }

  var nextArrow: Position.Arrow? {
    guard lineIndex + 1 >= currentComponent.spokenTextLines.count else { return nil }
    return currentPosition.arrow(forChangingTo: nextComponent?.position)
  }

  var nextLine: String? {
    guard lineIndex + 1 < currentComponent.spokenTextLines.count else { return nextComponent?.spokenTextLines.first }
    return currentComponent.spokenTextLines[lineIndex + 1]
  }

  private var movementSoundUrl: URL? {
    guard lineIndex == 0 else { return nil }
    guard let movementSound = currentComponent.movementSound else { return nil }

    return AudioPlayer.shared.movementSoundUrl(name: movementSound, instrument: movementSoundInstrument)
  }

  func moveToNextLine() -> Bool {
    previousLine = currentLine

    // update position
    previousPositon = currentPosition
    if lineIndex + 1 >= currentComponent.spokenTextLines.count {
      if let nextComponent = nextComponent {
        currentPosition = nextComponent.position
      }
    }

    guard lineIndex + 1 >= currentComponent.spokenTextLines.count else { lineIndex += 1; return true }
    lineIndex = 0

    guard componentIndex + 1 >= currentRakah.components().count else { componentIndex += 1; return true }
    componentIndex = 0

    guard rakatIndex + 1 >= prayer.rakat.count else { rakatIndex += 1; return true }
    return false
  }

  func prayerViewModel() -> PrayerViewModel {
    return PrayerViewModel(
      currentComponentName: currentComponent.name,
      previousArrow: previousArrow,
      previousLine: previousLine,
      currentArrow: currentArrow,
      currentLine: currentLine,
      isChapterName: false,
      currentIsComponentBeginning: lineIndex == 0,
      nextArrow: nextArrow,
      nextLine: nextLine,
      nextIsComponentBeginning: lineIndex + 1 == currentComponent.spokenTextLines.count
    )
  }
}
