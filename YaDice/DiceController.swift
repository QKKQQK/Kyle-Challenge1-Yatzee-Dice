//
//  DiceController.swift
//  YaDice
//
//  Created by Qiankang Zhou on 8/3/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import Foundation

class DiceController {
    var diceCount: UInt32
    var rollButtonTitle: String
    var rollCount: Int
    var diceArray: [DieButton]
    
    init() {
        diceCount = 5
        rollButtonTitle = "Roll"
        rollCount = 0
        diceArray = []
    }
    
    func rollDice(_ cheating: Bool) {
        if diceArray.isEmpty {
            return
        }
        if rollButtonTitle == "Reset" {
            reset()
            return
        }
        for dice in diceArray {
            if (!dice.frozen) {
                if cheating {
                    dice.num = 6
                } else {
                    dice.num = arc4random_uniform(6) + 1
                }
                dice.setTitle("\(dice.num)", for: .normal)
            }
        }
        rollCount += 1
        rollCount %= 4
        updateRollButtonTitle()
    }
    
    func reset() {
        if diceArray.isEmpty {
            return
        }
        for dice in diceArray {
            dice.num = 0
            dice.backgroundColor = dice.nonfrozenColor
            dice.frozen = false;
            dice.setTitle("\(dice.num)", for: .normal)
        }
        rollCount = 0
        updateRollButtonTitle()
    }
    
    func getScore() -> UInt32 {
        if diceArray.isEmpty {
            return 0
        }
        var sum: UInt32 = 0
        for dice in diceArray {
            sum += dice.num
        }
        return sum
    }
    
    func updateRollButtonTitle() {
        rollButtonTitle = "Roll \(rollCount + 1)"
        if rollCount == 3 {
            rollButtonTitle = "Reset"
        }
    }
}
