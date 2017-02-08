//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Alessandro Musto on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


class Dealer {
  let deck = Deck()
  var house = House(name: "House")
  var player = House(name: "Player")
  var bet : UInt = 0



  func place(bet : UInt) -> Bool {

    if player.tokens >= bet && house.tokens >= bet {
      self.bet = bet
      return true
    } else {
      self.bet = 0
      return false
    }
  }

  func deal() {
    while house.cards.count < 2 {
      house.cards.append(deck.drawCard())
      house.stayed = false
    }

    while player.cards.count < 2 {
      player.cards.append(deck.drawCard())
      player.stayed = false
    }

  }

  func turn(house : House) {
    print("Can house hit? : \(house.mayHit)")
    if house.mayHit {
      print("house has a score of: \(house.handscore)")
      if house.mustHit {
        print("Must house hit? : \(house.mustHit)")
        house.cards.append(deck.drawCard())
      } else {
        house.stayed = true
      }
    }
  }

  func winner() -> String {
    if ((player.busted == false && player.handscore > house.handscore) || (player.cards.count == 5 && player.handscore < 22) || (player.blackjack)) && player.handscore > 16 {
      return "player"
    } else if ((house.busted == false && house.handscore > player.handscore && house.handscore > 16) || (house.handscore == player.handscore) || house.blackjack || player.busted) && house.handscore > 16 {
      return "house"
    } else {
      return "no"
    }
  }

  func award() -> String {
    if winner() == "house" {
      house.tokens += self.bet
      player.tokens -= self.bet
      return "house wins \(bet)"
    } else if winner() == "player" {
      house.tokens -= self.bet
      player.tokens += self.bet
      return "player wins \(bet)"
    } else {
      return "no winner"
    }
  }

}
