//
//  PickyPlayer.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation

class PickyPlayer: Player {

    override func buy(tile: Tile) {
        if numberOfCoins > tile.buyPrice && tile.rentPrice >= 50 {
            loseCoins(coins: tile.buyPrice)
            tile.beenBought(player: self)
        }
    }

    override func getName() -> String {
        return "Picky"
    }

}
