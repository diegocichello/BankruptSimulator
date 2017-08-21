//
//  Board.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation

class Board {

    let tiles : [Tile]

    init(tiles: [Tile]) {
        self.tiles = tiles
    }

    func resetTiles() {
        for t in tiles {
            t.reset()
        }
    }

    func movePlayer(player: Player, numberOfTiles: Int) -> Bool {
        if player.position + numberOfTiles < self.tiles.count {
            player.moveToTile(tileNumber: player.position + numberOfTiles)
        } else {
            player.getCoins(coins: 100)
            player.moveToTile(tileNumber: player.position + numberOfTiles - self.tiles.count)
        }
        let playerTile = tiles[player.position]
        if playerTile.owner == nil {
            player.buy(tile: playerTile)
            //print("\(player.getName()) bought Tile: \(player.position)")
            return false
        } else {
            if playerTile.owner == player {
                return false
            } else {
                playerTile.owner?.getCoins(coins: playerTile.rentPrice)
                //print("\(player.getName()) payed \(playerTile.rentPrice) rent to \(playerTile.owner!.getName()) on Tile: \(player.position)")
                return player.loseCoins(coins: playerTile.rentPrice)
            }
        }
    }

    func resetPlayerTiles(player: Player) {
        for t in tiles {
            if let owner = t.owner {
                if owner == player {
                    t.reset()
                }
            }
        }
    }



}
