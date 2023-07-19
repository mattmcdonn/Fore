//
//  SkinsGolfPlayer.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-14.
//

import Foundation

class SkinsGolfPlayer{
    var playerName: String
    var golfHoles: [SkinsGolfHole]
    
    init(playerName: String, golfHoles: [SkinsGolfHole]) {
        self.playerName = playerName
        self.golfHoles = golfHoles
    }
    
    func getPlayerName() -> String{
        return self.playerName
    }
    
    func setPlayerName(newName: String){
        self.playerName = newName
    }
    
    func addGolfHole(golfHole: SkinsGolfHole){
        self.golfHoles.append(golfHole)
    }
    
    func getGolfHole(holeIndex: Int) -> SkinsGolfHole{
        return golfHoles[holeIndex]
    }
}

