//
//  Models.swift
//  DiceDuel
//
//  Created by Justin Wong on 10/22/25.
//

import Foundation

enum GameViewState {
    case start
    case game
}

struct DiceConfiguration {
    var minValue: Int
    var maxValue: Int
    
    func rollValue() -> Int {
        return Int.random(in: minValue...maxValue)
    }
}

struct Dice: Identifiable {
    let id = UUID()
    var value: Int
}
