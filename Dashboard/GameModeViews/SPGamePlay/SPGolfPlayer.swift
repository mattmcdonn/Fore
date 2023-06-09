//
//  SPGolfPlayer.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-08.
//

import Foundation

class SPGolfPlayer{
    var playerName: String
    var golfHoles: [SPGolfHole]
    
    init(playerName: String, golfHoles: [SPGolfHole]) {
        self.playerName = playerName
        self.golfHoles = golfHoles
    }
}


// make a golf game class and hold all players and for each player that have the golf holes they played, to access each specific hole use playerName.SPGolfHole[3]
