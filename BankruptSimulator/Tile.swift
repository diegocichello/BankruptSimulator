//
//  Tile.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation


class Tile {


    let buyPrice: Int
    let rentPrice: Int
    var owner: Player?


    init(buyPrice: Int, rentPrice: Int) {
        self.buyPrice = buyPrice
        self.rentPrice = rentPrice
    }

    func beenBought(player: Player) {
        self.owner = player
    }

    func reset () {
        owner = nil
    }




}
