//
//  RandomPlayer.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation

class RandomPlayer: Player {

    override func buy(tile: Tile) {
        let randomNumber = arc4random_uniform(1000)
        if numberOfCoins > tile.buyPrice && randomNumber % 2 == 0 {
            loseCoins(coins: tile.buyPrice)
            tile.beenBought(player: self)
        }
    }

    override func getName() -> String {
        return "Random"
    }
}
