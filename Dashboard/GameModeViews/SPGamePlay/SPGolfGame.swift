//
//  File.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-08.
//

import Foundation

class SPOnePlayerGolfGame{
    var player1: SPGolfPlayer
    var numberOfHoles: Int
    
    init(player1: SPGolfPlayer, numberOfHoles: Int) {
        self.player1 = player1
        self.numberOfHoles = numberOfHoles
    }
    
    func getNumberOfHoles() -> Int{
        return self.numberOfHoles
    }
    
    func setNumberOfHoles(newNumOfHoles: Int){
        self.numberOfHoles = newNumOfHoles
    }
}

class SPTwoPlayerGolfGame{
    var player1: SPGolfPlayer
    var player2: SPGolfPlayer
    var numberOfHoles: Int
    
    init(player1: SPGolfPlayer, player2: SPGolfPlayer, numberOfHoles: Int) {
        self.player1 = player1
        self.player2 = player2
        self.numberOfHoles = numberOfHoles
    }
    
    func getNumberOfHoles() -> Int{
        return self.numberOfHoles
    }
    
    func setNumberOfHoles(newNumOfHoles: Int){
        self.numberOfHoles = newNumOfHoles
    }
}

class SPThreePlayerGolfGame{
    var player1: SPGolfPlayer
    var player2: SPGolfPlayer
    var player3: SPGolfPlayer
    var numberOfHoles: Int
    
    init(player1: SPGolfPlayer, player2: SPGolfPlayer, player3: SPGolfPlayer, numberOfHoles: Int) {
        self.player1 = player1
        self.player2 = player2
        self.player3 = player3
        self.numberOfHoles = numberOfHoles
    }
    
    func getNumberOfHoles() -> Int{
        return self.numberOfHoles
    }
    
    func setNumberOfHoles(newNumOfHoles: Int){
        self.numberOfHoles = newNumOfHoles
    }
}

class SPFourPlayerGolfGame{
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
}
