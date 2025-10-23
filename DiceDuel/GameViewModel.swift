//
//  GameViewModel.swift
//  DiceDuel
//
//  Created by Justin Wong on 10/22/25.
//

import Foundation
import Observation

@Observable
class GameViewModel {
    
    var playerOneScore = 0
    var playerTwoScore = 0
    
    var playerOneDices: [Dice] = []
    var playerTwoDices: [Dice] = []
    
    @ObservationIgnored
    var diceConfiguration: DiceConfiguration?
    @ObservationIgnored
    var numOfDices = 1
    
    func startGame(numOfDices: Int, numOfDiceSides: Int) {
        self.numOfDices = numOfDices
        diceConfiguration = DiceConfiguration(minValue: 1, maxValue: numOfDiceSides)
    }
    
    func rollDice() {
        guard let diceConfiguration else {
            return
        }
        
        playerOneDices.removeAll()
        playerTwoDices.removeAll()
        
        (0..<numOfDices).forEach { _ in
            playerOneDices.append(Dice(value: diceConfiguration.rollValue()))
            playerTwoDices.append(Dice(value: diceConfiguration.rollValue()))
        }
        
        playerOneScore += playerOneDices.map{ $0.value }.reduce(0, +)
        playerTwoScore += playerTwoDices.map{ $0.value }.reduce(0, +)
    }
    
    func resetGame() {
        playerOneScore = 0
        playerTwoScore = 0
        
        playerOneDices.removeAll()
        playerTwoDices.removeAll()
        
        diceConfiguration = nil
        numOfDices = 1
    }
}
