//
//  Player.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation


class Player : NSObject {

    var numberOfCoins = 0
    var position = -1
    var playing: Bool = false

    func buy(tile: Tile) {
        //should be overriden
    }

    func getName() -> String {
        //should be overriden
        return ""
    }

    func reset() {
        numberOfCoins = 0
    }

    func beginGame() {
        numberOfCoins = 300
        position = -1
        playing = true
    }

    func moveToTile(tileNumber: Int) {
        position = tileNumber
    }

    func getCoins(coins: Int) {
        numberOfCoins += coins
    }

    func loseCoins(coins: Int) -> Bool {
        numberOfCoins -= coins
        if numberOfCoins < 0 {
            return true
        } else {
            return false
        }
    }

}


