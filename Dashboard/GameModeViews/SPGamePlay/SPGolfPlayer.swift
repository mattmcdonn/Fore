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
    
    func getPlayerName() -> String{
        return self.playerName
    }
    
    func setPlayerName(newName: String){
        self.playerName = newName
    }
    
    func addGolfHole(golfHole: SPGolfHole){
        self.golfHoles.append(golfHole)
    }
    
    func getGolfHole(holeIndex: Int) -> SPGolfHole{
        return golfHoles[holeIndex]
    }
}
