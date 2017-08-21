//
//  BoardParser.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation


class BoardParser {


    static func parseBoardFromFile() -> Board? {

        var tiles: [Tile] = [Tile]()

        if let path = Bundle.main.path(forResource: "gameConfig", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let tilesString = data.components(separatedBy: .newlines)
                for string in tilesString {
                    let tileProperties = string.components(separatedBy: .whitespaces)
                    let tile = Tile(buyPrice: Int(tileProperties.first!)!, rentPrice: Int(tileProperties.last!)!)
                    tiles.append(tile)
                }
                return Board(tiles: tiles)

            } catch {
                print("Error Loading File")

            }
        }
        print("Board not initializing")
        return nil
    }
}
