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
    var skinsWon: Int
    
    init(playerName: String, golfHoles: [SkinsGolfHole], skinsWon: Int) {
        self.playerName = playerName
        self.golfHoles = golfHoles
        self.skinsWon = skinsWon
    }
    
    func getPlayerName() -> String{
        return self.playerName
    }
    
    func setPlayerName(newName: String){
        self.playerName = newName
    }
    
    func getSkinsWon() -> Int{
        return self.skinsWon
    }
    
    func addToSkinsWon() -> Void{
        self.skinsWon += 1
    }
    
    func setSkinsWon(newInt: Int) -> Void{
        self.skinsWon = newInt
    }
    
    func addGolfHole(golfHole: SkinsGolfHole){
        self.golfHoles.append(golfHole)
    }
    
    func getGolfHole(holeIndex: Int) -> SkinsGolfHole{
        return golfHoles[holeIndex]
    }
}

