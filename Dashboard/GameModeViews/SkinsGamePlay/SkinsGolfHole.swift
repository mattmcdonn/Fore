//
//  SkinsGolfHole.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-14.
//

import Foundation

class SkinsGolfHole {
    var holeNumber: Int
    var playerStrokes: Int
    var parNumber: Int
    
    init(holeNumber: Int, parNumber: Int, playerStrokes: Int){
        self.holeNumber = holeNumber
        self.parNumber = parNumber
        self.playerStrokes = playerStrokes
    }
    
    func getHoleNumber() -> Int{
        return self.holeNumber
    }
    
    func setHoleNumber(holeNum: Int){
        self.holeNumber = holeNum
    }
    
    func getParNumber() -> Int{
        return self.parNumber
    }
    
    func setParNumber(parNum: Int){
        self.parNumber = parNum
    }
    
    func getPlayerStrokes() -> Int{
        return self.playerStrokes
    }
    
    func setPlayerStrokes(strokeNum: Int) -> Void{
        self.playerStrokes = strokeNum
    }
}
