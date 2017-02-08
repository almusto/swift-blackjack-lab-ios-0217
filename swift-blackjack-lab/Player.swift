//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Alessandro Musto on 2/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
/*
 
 name, a string,
 cards, an array of Card objects,
 handscore, an unsigned integer,
 blackjack, a boolean,
 busted, a boolean,
 stayed, a boolean,
 mayHit, a boolean,
 tokens, an unsigned integer, and
 description, a string.
 
 */

class Player {

  let name : String
  var cards : [Card] = []
  var handscore : UInt {
    return score()
  }
  var blackjack : Bool {
    return cards.count == 2 && score() == 21
  }
  var stayed : Bool = false
  var busted : Bool {
    return score() > 21
  }


  var mayHit : Bool {
    return !blackjack && !busted && !stayed
  }
  var tokens : UInt = 100
  var description : String {
    return "name : \(name), cards: \(cards), handscore: \(handscore), blackjack: \(blackjack), busted : \(busted), stayed: \(stayed), tokens: \(tokens)"

  }

  init(name : String) {
    self.name = name

  }

  fileprivate func score() -> UInt {
    var score : UInt = 0
    for card in cards {
      score += card.cardValue
    }

   if containsAce() && score < 12 {
        score += 10
    }
    return score
  }

  func canPlace(bet : UInt) -> Bool {
    return tokens >= bet
  }

  func didWin(bet : UInt) {
    tokens += bet
  }


  func didLose(bet : UInt) {
    tokens -= bet
  }

  func containsAce() -> Bool {
    for card in cards {
      if card.rank == "A" {
        return true
      }
    }
    return false
  }



}
