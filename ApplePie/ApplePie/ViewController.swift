//
//  ViewController.swift
//  ApplePie
//
//  Created by Ananaya on 08/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    {didSet {
        newRound()
    }
    }

    var totalLoses = 0
    {didSet {
        newRound()
    }
    }

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    
    var currentGame: Game!
    func newRound() {
         if !listOfWords.isEmpty {
                let newWord = listOfWords.removeFirst()
                currentGame = Game(word: newWord,
                incorrectMovesRemaining: incorrectMovesAllowed,
                guessedLetters: [])
                enableLetterButtons(true)
                updateUI()
            } else {
                enableLetterButtons(false)
            }
       
    }
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButton {
        button.isEnabled = enable
      }
    }
   
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        //        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLoses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLoses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
}

