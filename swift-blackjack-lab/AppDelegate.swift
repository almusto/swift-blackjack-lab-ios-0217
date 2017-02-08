//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

  let dealer = Dealer()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

      let deck = dealer.deck



      deck.shuffle()

      print(deck.description)
      let bet : UInt = 20

      if dealer.place(bet: bet) == true {

        dealer.deal()
        for card in dealer.house.cards {
          print("house cards: \(card.description)")
        }
        for card in dealer.player.cards {
          print("player cards: \(card.description)")
        }
      } else {
        print("Not enough tokens!")
      }

      print(deck.description)

      playBlackjack(withBet: bet)

      print(deck.description)

        // Do not alter
        return true  //
    }   ///////////////
    
  func playBlackjack(withBet  bet : UInt) {


    if dealer.house.blackjack {
      print(dealer.winner())
    } else {
      print(dealer.winner())
      while dealer.winner() == "no" {
        dealer.turn(house: dealer.player)
        dealer.turn(house: dealer.house)
        }
      }

    for card in dealer.house.cards {
      print("house cards: \(card.description)")
    }
    for card in dealer.player.cards {
      print("player cards: \(card.description)")
    }


    print(dealer.winner())

    print(dealer.award())

    print(dealer.player.tokens)
    print(dealer.house.tokens)

  }







}

