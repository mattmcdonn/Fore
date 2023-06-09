//
//  SPHoleCount.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

struct SPHoleCount: View {
    
    @State var numOfHoles = 0
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
                NavigationLink(destination: SPHoleGamePlay()){
                    ZStack{
                        Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(startButtonColor)
                        Text("Start").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        
                    }
                }.padding(.top, 200).disabled(noHoleSelected)
                
                
            }.frame(width: 350, height: 750)
            
        }
    
    func setUpGame(){
        
        if SPPlayerCount().getNumOfPlayers() == 1{
            
            let PLAYER_ONE = SPGolfPlayer(playerName: "PLAYER 1", golfHoles: [])
            
            let SP_GAME = SPOnePlayerGolfGame(player1: PLAYER_ONE, numberOfHoles: numOfHoles)
        }
        
        if SPPlayerCount().getNumOfPlayers() == 2{
            
            let PLAYER_ONE = SPGolfPlayer(playerName: "PLAYER 1", golfHoles: [])
            
            let PLAYER_TWO = SPGolfPlayer(playerName: "PLAYER 2", golfHoles: [])
            
            let SP_GAME = SPTwoPlayerGolfGame(player1: PLAYER_ONE, player2: PLAYER_TWO, numberOfHoles: numOfHoles)
        }
        
        if SPPlayerCount().getNumOfPlayers() == 3{
            
            let PLAYER_ONE = SPGolfPlayer(playerName: "PLAYER 1", golfHoles: [])
            
            let PLAYER_TWO = SPGolfPlayer(playerName: "PLAYER 2", golfHoles: [])
            
            let PLAYER_THREE = SPGolfPlayer(playerName: "PLAYER 3", golfHoles: [])
            
            let SP_GAME = SPThreePlayerGolfGame(player1: PLAYER_ONE, player2: PLAYER_TWO, player3: PLAYER_THREE, numberOfHoles: numOfHoles)
            
        }
        
        if SPPlayerCount().getNumOfPlayers() == 4{
            
            let PLAYER_ONE = SPGolfPlayer(playerName: "PLAYER 1", golfHoles: [])
            
            let PLAYER_TWO = SPGolfPlayer(playerName: "PLAYER 2", golfHoles: [])
            
            let PLAYER_THREE = SPGolfPlayer(playerName: "PLAYER 3", golfHoles: [])
            
            let PLAYER_FOUR = SPGolfPlayer(playerName: "PLAYER 4", golfHoles: [])
            
            let SP_GAME = SPFourPlayerGolfGame(player1: PLAYER_ONE, player2: PLAYER_TWO, player3: PLAYER_THREE, player4: PLAYER_FOUR, numberOfHoles: numOfHoles)
            
        }
        
    }
}


struct SPHoleCount_Previews: PreviewProvider {
    static var previews: some View {
        SPHoleCount()
    }
}
