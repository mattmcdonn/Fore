//
//  File.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-08.
//

import Foundation

class SPGolfGame{
    var player1: SPGolfPlayer
    var player2: SPGolfPlayer
    var player3: SPGolfPlayer
    var player4: SPGolfPlayer
    var numberOfHoles: Int
    
    init(player1: SPGolfPlayer, player2: SPGolfPlayer, player3: SPGolfPlayer, player4: SPGolfPlayer, numberOfHoles: Int) {
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
    
    func getPlayerOne() -> SPGolfPlayer{
        return self.player1
    }
    
    func getPlayerTwo() -> SPGolfPlayer{
        return self.player2
    }
    
    func getPlayerThree() -> SPGolfPlayer{
        return self.player3
    }
    
    func getPlayerFour() -> SPGolfPlayer{
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
