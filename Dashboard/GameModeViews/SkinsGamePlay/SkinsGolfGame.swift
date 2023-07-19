//
//  SkinsGolfGame.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-14.
//

import Foundation

class SkinsGolfGame{
    var player1: SkinsGolfPlayer
    var player2: SkinsGolfPlayer
    var player3: SkinsGolfPlayer
    var player4: SkinsGolfPlayer
    var numberOfHoles: Int
    
    init(player1: SkinsGolfPlayer, player2: SkinsGolfPlayer, player3: SkinsGolfPlayer, player4: SkinsGolfPlayer, numberOfHoles: Int) {
        self.player1 = player1
        self.player2 = player2
        self.player3 = player3
        self.player4 = player4
        self.numberOfHoles = numberOfHoles
    }
    
    func getNumberOfHoles() -> Int{
        return self.numberOfHoles
    }
    
    func setNumberOfHoles(newNumOfHoles: Int){
        self.numberOfHoles = newNumOfHoles
    }
    
    func getPlayerOne() -> SkinsGolfPlayer{
        return self.player1
    }
    
    func getPlayerTwo() -> SkinsGolfPlayer{
        return self.player2
    }
    
    func getPlayerThree() -> SkinsGolfPlayer{
        return self.player3
    }
    
    func getPlayerFour() -> SkinsGolfPlayer{
        return self.player4
    }
    
    func getNumOfPlayers() -> Int{
        var numOfPlayers = 0
        
        if player1.getPlayerName() != "NA"{
            numOfPlayers += 1
        }
        
        if player2.getPlayerName() != "NA"{
            numOfPlayers += 1
        }
        
        if player3.getPlayerName() != "NA"{
            numOfPlayers += 1
        }
        
        if player4.getPlayerName() != "NA"{
            numOfPlayers += 1
        }
        
        return numOfPlayers
    }
}
