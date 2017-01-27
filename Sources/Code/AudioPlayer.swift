//
//  AudioPlayer.swift
//  Prayer
//
//  Created by Cihat Gündüz on 25.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import AVFoundation

class AudioPlayer {
    // MARK: - Stored Type Properties

    static let shared = AudioPlayer()


    // MARK: - Instance Properties

    private var audioPlayer: AVAudioPlayer?


    // MARK: - Instance Methods

    func movementSoundUrl(name: String, instrument: String) -> URL? {
        return Bundle.main.url(forResource: instrument, withExtension: "caf", subdirectory: name)
    }

    func playSound(at url: URL) {
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
}
