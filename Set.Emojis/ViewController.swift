//
//  ViewController.swift
//  Set
//
//  Created by beckerresearch on 3/16/19.
//  Copyright © 2019 Washington University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game =  Set()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
    
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func dealCards(_ sender: UIButton) {
        var count = 0
        let attributes: [NSAttributedString.Key: Any] = [
            :
        ]
        let attributedtext = NSAttributedString(string: "", attributes: attributes)
        for index in cardButtons.indices{
            let button = cardButtons?[index]
            if button?.attributedTitle(for: UIControl.State.normal)==attributedtext{
                count += 1
            }
        }
        if count >= 3 {
            game.deal3Cards()
        }
        updateViewFromModel()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = Set()
        updateViewFromModel()
    }
    
    
    @IBOutlet weak var scoreLabel: UILabel!{
        didSet {
            scoreLabel.text = "Score: \(game.score)"
        }
    }
    private func updateViewFromModel(){
        var count = 0
        scoreLabel.text = "Score: \(game.score)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            var cardSymbols = String()
            var sColor = UIColor.white
            var sAlpha : CGFloat = 1.0
            var sWidth = 0
            var shape = String()
            if let card = game.inPlayCards[index]{
                switch card.color.rawValue {
                case 1:  sColor = UIColor.red
                case 2: sColor = UIColor.green
                case 3: sColor = UIColor.blue
                default:
                    sColor = UIColor.white
                    break
                }
                switch card.shading.rawValue {
                case 1:
                    sAlpha = 1.0
                    sWidth = -1
                case 2:
                    sAlpha = 0.15
                    sWidth = -1
                case 3:
                    sAlpha = 1.0
                    sWidth = 2
                default:
                    break
                }
                
                switch card.shape.rawValue{
                case 1:
                    shape = "\u{25B2}"
                case 2:
                    shape = "\u{25CF}"
                case 3:
                    shape = "\u{25A0}"
                default:
                    break
                }
                let attributes: [NSAttributedString.Key: Any] = [
                    .strokeColor : sColor.withAlphaComponent(sAlpha),
                    .foregroundColor : sColor.withAlphaComponent(sAlpha),
                    .strokeWidth : sWidth,
                    .font: UIFont.systemFont(ofSize: 25)
                ]
                for _ in 1...card.number.rawValue{
                    cardSymbols.append(shape)
                }
                
                let attributedtext = NSAttributedString(string: "\(cardSymbols)", attributes: attributes)
                button.setAttributedTitle(attributedtext, for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                if game.selectedCards.contains(card){
                    button.layer.borderWidth = 3.0
                    button.layer.cornerRadius = 8.0
                    button.layer.borderColor = UIColor.blue.cgColor
                } else
                {
                    button.layer.borderWidth = 0.0
                    button.layer.cornerRadius = 0.0
                    button.layer.borderColor = UIColor.black.cgColor
                }
            } else {
                let attributes: [NSAttributedString.Key: Any] = [
                    .strokeColor : sColor.withAlphaComponent(sAlpha),
                    .foregroundColor : sColor.withAlphaComponent(sAlpha),
                    .strokeWidth : sWidth,
                    .font: UIFont.systemFont(ofSize: 25),
                    .backgroundColor: #colorLiteral(red: 0.9599528909, green: 0.7116184831, blue: 0.1950232387, alpha: 0)
                ]
                let attributedtext = NSAttributedString(string: "", attributes: attributes)
                button.setAttributedTitle(attributedtext, for: UIControl.State.normal)
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9599528909, green: 0.7116184831, blue: 0.1950232387, alpha: 0)
                button.layer.borderWidth = 0.0
                button.layer.cornerRadius = 0.0
                button.layer.borderColor = UIColor.black.cgColor
                count += 1
            }
        }
        if count == 0 || game.cards.cards.isEmpty {
            newGameButton.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        } else {
            newGameButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        }
        
    }
    
}

