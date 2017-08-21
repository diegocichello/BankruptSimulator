//
//  ViewController.swift
//  BankruptSimulator
//
//  Created by Diego Cichello on 8/16/17.
//  Copyright © 2017 DiegoCo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var numberOfGames: UITextField!
    @IBOutlet weak var numberOfRounds: UITextField!
    @IBOutlet weak var startButton: UIButton!

    var winners: [String: Int] = [String:Int]()
    var averageRounds: Int = 0
    var numberOfGamesByTimeOut: Int = 0
    
    @IBAction func startSimulatorClick(_ sender: Any) {

        startLoading()
        cleanSimulationData()

        let gameManager = GameManager()
        var games: Int = 0
        var rounds: Int = 0

        if let numberGames = Int(numberOfGames.text!) {
            games = numberGames
        }

        if let numberRounds = Int(numberOfRounds.text!) {
            rounds = numberRounds
        }

        for i in 1...games {
            let gameFinishedData = gameManager.simulateGame(numberOfRounds: rounds)
            let winner = gameFinishedData.winner
            if let numberOfWins = winners[winner] {
                winners[winner] = numberOfWins + 1
            } else {
                winners[winner] = 1
            }
            if gameFinishedData.finishedByTime {
                numberOfGamesByTimeOut += 1
            }
            averageRounds = (averageRounds * (i - 1) + gameFinishedData.numberOfRounds) / i
        }

        finishedLoading()
        showResults()

    }

    func startLoading() {
        self.textView.text = ""
        self.startButton.isEnabled = false
    }

    func finishedLoading() {
        self.startButton.isEnabled = true
    }

    func cleanSimulationData() {
        winners = [String:Int]()
        averageRounds = 0
        numberOfGamesByTimeOut = 0
    }

    func showResults() {

        var text = ""
        let sorted = winners.sorted(by: {$0.value > $1.value})
        for p in sorted {
            text.append("\(p.key): \(p.value) \n")
        }
        text.append("Average number of rounds: \(averageRounds) \n")
        text.append("Games finished by time: \(numberOfGamesByTimeOut)")

        self.textView.text = text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        numberOfGames.resignFirstResponder()
        numberOfRounds.resignFirstResponder()
    }


}

