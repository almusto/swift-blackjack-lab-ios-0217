//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Alessandro Musto on 2/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
  fileprivate var remainingCards : [Card] = []
  fileprivate var dealtCards : [Card] = []
  var description : String  {
    return "Cards Remaining: \(remainingCards.count),  Cards Dealt: \(dealtCards.count)"
  }

  init() {
    var deck : [Card] = []
    let rankArray = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    let suitsAndRankDict = ["♠︎" : rankArray,
                            "♥︎" : rankArray,
                            "♦︎" : rankArray,
                            "♣︎" : rankArray
    ]

    for (suit, ranks) in suitsAndRankDict {
      for rank in ranks {
        deck.append(Card(suit: suit, rank: rank))
      }
    }

    remainingCards = deck
    dealtCards = []
  }

  func drawCard() -> Card {
      let card = remainingCards.last
      self.remainingCards.removeLast()
      self.dealtCards.append(card!)
      return card!

  }

  func shuffle() {
    var remainingCopy = self.remainingCards
    var newRemaining : [Card] = []
    while remainingCopy.count > 0 {
      let index = Int(arc4random_uniform(UInt32(remainingCopy.count)))
      let card = remainingCopy[index]
      remainingCopy.remove(at: index)
      newRemaining.append(card)

    }

    self.remainingCards = newRemaining

  }


}
