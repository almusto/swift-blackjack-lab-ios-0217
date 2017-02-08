//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Alessandro Musto on 2/7/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


class Card {
  var suit : String
  var rank : String
  var cardLabel : String
  var cardValue : UInt {
    return determineCardValue(rank)
  }

  var sortValue : UInt {
    return determineSortValue(rank)
  }
  var description : String {
    return cardLabel
  }



  init(suit : String, rank : String) {
    self.suit = suit
    self.rank = rank
    cardLabel = "\(suit)\(rank)"

  }

  func validSuits() -> [String] {
    return ["♠︎","♥︎","♦︎","♣︎"]

  }

  func validRanks() -> [String] {
    return ["A","1","2","3","4","5","6","7","8","9","10","J","Q","K"]
  }

  func determineCardValue(_ rank : String) -> UInt {
    switch rank {
    case "A":
      return 1
    case "K":
      return 10
    case "Q":
      return 10
    case "J":
      return 10
    default:
      return UInt(rank)!
    }
  }

  func determineSortValue(_ rank : String) -> UInt {
    switch rank {
    case "A":
      return 1
    case "K":
      return 13
    case "Q":
      return 12
    case "J":
      return 11
    default:
      return UInt(rank)!
    }
  }
}

func descriptionFor(cardArray : [Card]) -> String {

  var spadeRankArray : [Card] = []
  var heartRankArray : [Card] = []
  var dimondRankArray : [Card] = []
  var clubRankArray : [Card] = []

  for card in cardArray {
    switch card.suit {
    case "♠︎":
      spadeRankArray.append(card)
    case "♥︎":
      heartRankArray.append(card)
    case "♦︎":
      dimondRankArray.append(card)
    case "♣︎":
      clubRankArray.append(card)
    default:
      print("0_o")
    }

  }
  var spades = spadeRankArray
  spades.sort {
    return $0.sortValue < $1.sortValue
  }


  var hearts = heartRankArray
  hearts.sort {
    return $0.sortValue < $1.sortValue
  }
  var clubs = clubRankArray
  clubs.sort {
    return $0.sortValue < $1.sortValue
  }
  var dimonds = dimondRankArray
  dimonds.sort {
    return $0.sortValue < $1.sortValue
  }

  var spadeString : String = ""
  var heartString : String = ""
  var dimondString : String = ""
  var clubString : String = ""

  for card in spades {
    spadeString.append(card.description)
  }
  for card in hearts {
    heartString.append(card.description)
  }
  for card in dimonds {
    dimondString.append(card.description)
  }
  for card in clubs {
    clubString.append(card.description)
  }

  return ("\(spadeString)\n\(heartString)\n\(dimondString)\n\(clubString)")


}
