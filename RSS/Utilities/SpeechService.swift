//
//  SpeechService.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/18/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import AVFoundation

enum speechRate: Float, CaseIterable{
    case slow    = 0.25
    case normal  = 0.5
    case fast    = 1.0
    case toofast = 1.25
    init() {
        self = .slow
    }
    
    mutating func next() {
        let allCases = type(of: self).allCases
        guard let selfIndex = allCases.firstIndex(of: self) else { return }
        let nextIndex = allCases.index(after: selfIndex)
        self = allCases[(nextIndex) % allCases.count]
    }
}

class SpeechService {
    private let synthesizer = AVSpeechSynthesizer()
    var rate = speechRate.toofast
    func say(_ phrase: String) {
        let utterance = AVSpeechUtterance(string: phrase)
        utterance.rate = rate.rawValue
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        self.stopPlaying()
        synthesizer.speak(utterance)
    }
    
    func changeRate() {
        rate.next()
    }
    
    func stopPlaying() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
