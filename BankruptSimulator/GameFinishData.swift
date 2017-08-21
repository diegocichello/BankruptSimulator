//
//  GameFinishData.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/17/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation

class GameFinishData {

    var winner: String
    var numberOfRounds: Int
    var finishedByTime: Bool = false


    init(winner: String, numberOfRounds: Int, finishedByTime: Bool) {
        self.winner = winner
        self.numberOfRounds = numberOfRounds
        self.finishedByTime = finishedByTime
    }

}
