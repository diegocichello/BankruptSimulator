//
//  CautiousPlayer.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation

class CautiousPlayer: Player {

    override func buy(tile: Tile) {
        if numberOfCoins + 80 > tile.buyPrice {
            loseCoins(coins: tile.buyPrice)
            tile.beenBought(player: self)
        }
    }

    override func getName() -> String {
        return "Cautious"
    }

}
