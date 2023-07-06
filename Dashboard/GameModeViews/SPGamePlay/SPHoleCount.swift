//
//  SPHoleCount.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

var PLAYER_ONE = SPGolfPlayer(playerName: "NA", golfHoles: [])
var PLAYER_TWO = SPGolfPlayer(playerName: "NA", golfHoles: [])
var PLAYER_THREE = SPGolfPlayer(playerName: "NA", golfHoles: [])
var PLAYER_FOUR = SPGolfPlayer(playerName: "NA", golfHoles: [])

var GOLF_GAME = SPGolfGame(player1: PLAYER_ONE, player2: PLAYER_TWO, player3: PLAYER_THREE, player4: PLAYER_FOUR, numberOfHoles: 0)

var numOfHoles = 0

struct SPHoleCount: View {
    
    @State var NUM_OF_PLAYERS = SPPlayerCount().getNumOfPlayers()
    @State var NUM_OF_HOLES = numOfHoles
    
    @State var noHoleSelected = true
    @State var buttonNineColor = Color.white
    @State var buttonEighteenColor = Color.white
    @State var startButtonColor = Color.white
    
    var body: some View {
        VStack{
            
            Text("Number of holes").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
            
            HStack{
            
                    Button(action: {
                        noHoleSelected = false
                        numOfHoles = 9
                        buttonNineColor = Color.green
                        buttonEighteenColor = Color.white
                        startButtonColor = Color.green
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonNineColor)
                            Text("9").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    Button(action: {
                        noHoleSelected = false
                        numOfHoles = 18
                        buttonNineColor = Color.white
                        buttonEighteenColor = Color.green
                        startButtonColor = Color.green
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonEighteenColor)
                            Text("18").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    
                
                
            }
            
            NavigationLink(destination: SPReviewSetup().onAppear(perform: setUpGame)){
                    
                    ZStack{
                        Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(startButtonColor)
                        Text("Start").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        
                    }
            }.padding(.top, 200).disabled(noHoleSelected)
                
                
            }.frame(width: 350, height: 750)
            
        }
    
    func getNumOfHoles() -> Int{
        return numOfHoles
    }
        
    func setUpGame() -> Void{
        if NUM_OF_PLAYERS == 1{
            PLAYER_ONE.setPlayerName(newName: "Player 1")
            PLAYER_TWO.setPlayerName(newName: "NA")
            PLAYER_THREE.setPlayerName(newName: "NA")
            PLAYER_FOUR.setPlayerName(newName: "NA")
        } else if NUM_OF_PLAYERS == 2{
            PLAYER_ONE.setPlayerName(newName: "Player 1")
            PLAYER_TWO.setPlayerName(newName: "Player 2")
            PLAYER_THREE.setPlayerName(newName: "NA")
            PLAYER_FOUR.setPlayerName(newName: "NA")
        } else if NUM_OF_PLAYERS == 3{
            PLAYER_ONE.setPlayerName(newName: "Player 1")
            PLAYER_TWO.setPlayerName(newName: "Player 2")
            PLAYER_THREE.setPlayerName(newName: "Player 3")
            PLAYER_FOUR.setPlayerName(newName: "NA")
        } else if NUM_OF_PLAYERS == 4{
            PLAYER_ONE.setPlayerName(newName: "Player 1")
            PLAYER_TWO.setPlayerName(newName: "Player 2")
            PLAYER_THREE.setPlayerName(newName: "Player 3")
            PLAYER_FOUR.setPlayerName(newName: "Player 4")
        }
        
        GOLF_GAME.setNumberOfHoles(newNumOfHoles: NUM_OF_HOLES)
    }
}


struct SPHoleCount_Previews: PreviewProvider {
    static var previews: some View {
        SPHoleCount()
    }
}
