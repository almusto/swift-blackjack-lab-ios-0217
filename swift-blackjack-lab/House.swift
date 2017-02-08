//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Alessandro Musto on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


class House : Player {

  var mustHit : Bool {
    return handscore < 17
  }

  override init(name : String) {
    super.init(name: name)
    tokens = 1000
  }

}
