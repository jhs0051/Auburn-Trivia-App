//
//  PlaySound.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/25/22.
//

import Foundation
import AVFAudio

var audio: AVAudioPlayer!

func playSound(key: String) {
        let url = Bundle.main.url(forResource: key, withExtension: "mp3")
        // Do nothing if this url is empty
        guard url != nil else {
            return
        }
        do {
            audio = try AVAudioPlayer(contentsOf: url!)
            audio?.play()
        } catch {
            print("error")
    }
}
