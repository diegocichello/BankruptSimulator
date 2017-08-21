//
//  GameManager.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import Foundation

class GameManager {

    let board: Board!
    var players: [Player] = [Player]()
    var running: Bool = false


    init() {
        self.board = BoardParser.parseBoardFromFile()
        self.players = [ImpulsivePlayer(),CautiousPlayer(),PickyPlayer(),RandomPlayer()]
    }


    func simulateGame(numberOfRounds: Int = 1000) -> GameFinishData {
        startGame()
        var roundFinished = 0
        var finishedByTime = true

        for i in 1...numberOfRounds {
            if running {
                playRound()
            } else {
                finishedByTime = false
                break
            }
            roundFinished = i
        }

        var winner: Player = players.first!

        for p in players {
            if p.numberOfCoins > winner.numberOfCoins {
                winner = p
            }

            print("\(p.getName()) + total coins: \(p.numberOfCoins)")
        }

        return GameFinishData(winner: winner.getName(), numberOfRounds: roundFinished, finishedByTime: finishedByTime)
    }

    func startGame() {
        running = true
        self.players.shuffle()
        board.resetTiles()
        for p in self.players {
            p.beginGame()
        }
    }

    func playRound() {
        for p in players {
            if !p.playing {
                continue
            }
            let playerLost = board.movePlayer(player: p, numberOfTiles: playDice())
            if playerLost {
                removePlayer(player: p)
                if numberOfPlayersInGame() == 1 {
                    finishGame()
                }
            }
        }
    }



    func finishGame() {
        running = false

    }

    func removePlayer(player: Player) {
        player.playing = false
        board.resetPlayerTiles(player: player)
    }

    func numberOfPlayersInGame() -> Int {
        var i = 0
        for p in players {
            if p.playing {
                i += 1
            }
        }
        return i
    }

    func playDice() -> Int {
        return Int(arc4random_uniform(6)) + 1
    }





}
