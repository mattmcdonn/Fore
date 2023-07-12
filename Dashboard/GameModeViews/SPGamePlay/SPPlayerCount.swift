//
//  StrokePlayGameView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-06.
//

import SwiftUI

var numOfPlayers = 0
var personalPlayer = 1

var playerOneButtonDisabled = true
var playerTwoButtonDisabled = true
var playerThreeButtonDisabled = true
var playerFourButtonDisabled = true

var playerOneButtonColor = Color.white
var playerTwoButtonColor = Color.white
var playerThreeButtonColor = Color.white
var playerFourButtonColor = Color.white

struct SPPlayerCount: View {
    
    
    @State var noPlayersSelected = true
    
    @State var buttonOneColor = Color.white
    @State var buttonTwoColor = Color.white
    @State var buttonThreeColor = Color.white
    @State var buttonFourColor = Color.white
    
    @State var continueButtonColor = Color.white
    
    
    var body: some View {
        VStack{
            Text("How many players").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
            
            HStack{
                VStack{
                    Button(action: {
                        noPlayersSelected = false
                        numOfPlayers = 1
                        buttonOneColor = Color.green
                        buttonTwoColor = Color.white
                        buttonThreeColor = Color.white
                        buttonFourColor = Color.white
                        continueButtonColor = Color.green
                        disablePlayerOptions()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonOneColor)
                            Text("1").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    Button(action: {
                        noPlayersSelected = false
                        numOfPlayers = 3
                        buttonOneColor = Color.white
                        buttonTwoColor = Color.white
                        buttonThreeColor = Color.green
                        buttonFourColor = Color.white
                        continueButtonColor = Color.green
                        disablePlayerOptions()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonThreeColor)
                            Text("3").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                }
                
                
                
                
                VStack{
                    Button(action: {
                        noPlayersSelected = false
                        numOfPlayers = 2
                        buttonOneColor = Color.white
                        buttonTwoColor = Color.green
                        buttonThreeColor = Color.white
                        buttonFourColor = Color.white
                        continueButtonColor = Color.green
                        disablePlayerOptions()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonTwoColor)
                            Text("2").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    Button(action: {
                        noPlayersSelected = false
                        numOfPlayers = 4
                        buttonOneColor = Color.white
                        buttonTwoColor = Color.white
                        buttonThreeColor = Color.white
                        buttonFourColor = Color.green
                        continueButtonColor = Color.green
                        disablePlayerOptions()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonFourColor)
                            Text("4").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                }
            }
            
            
            NavigationLink(destination: SPPersonalPlayer()){
                
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(continueButtonColor)
                    Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }.padding(.top, 200).disabled(noPlayersSelected)
            
            
        }.frame(width: 350, height: 750)
    }
    
    func getNumOfPlayers() -> Int{
        return numOfPlayers
    }
    
    func disablePlayerOptions() -> Void{
        if numOfPlayers == 1{
            playerOneButtonDisabled = false
            playerTwoButtonDisabled = true
            playerThreeButtonDisabled = true
            playerFourButtonDisabled = true
        } else if numOfPlayers == 2{
            playerOneButtonDisabled = true
            playerTwoButtonDisabled = false
            playerThreeButtonDisabled = true
            playerFourButtonDisabled = true
        } else if numOfPlayers == 3{
            playerOneButtonDisabled = true
            playerTwoButtonDisabled = true
            playerThreeButtonDisabled = false
            playerFourButtonDisabled = true
        } else if numOfPlayers == 4{
            playerOneButtonDisabled = true
            playerTwoButtonDisabled = true
            playerThreeButtonDisabled = true
            playerFourButtonDisabled = false
        }
    }
}


struct SPPersonalPlayer: View{
    
    @State var continueButtonColor = Color.white
    @State var continueButtonDisabled = true
    
    var body: some View{
        VStack{
            Text("Select your player").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
            
            Button(action: {
                personalPlayer = 1
                playerOneButtonColor = Color.green
                playerTwoButtonColor = Color.white
                playerThreeButtonColor = Color.white
                playerFourButtonColor = Color.white
                continueButtonColor = Color.green
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerOneButtonColor)
                    Text("Player 1").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(playerOneButtonDisabled)
            
            Button(action: {
                personalPlayer = 2
                playerOneButtonColor = Color.white
                playerTwoButtonColor = Color.green
                playerThreeButtonColor = Color.white
                playerFourButtonColor = Color.white
                continueButtonColor = Color.green
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerTwoButtonColor)
                    Text("Player 2").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(playerTwoButtonDisabled)
            
            Button(action: {
                personalPlayer = 3
                playerOneButtonColor = Color.white
                playerTwoButtonColor = Color.white
                playerThreeButtonColor = Color.green
                playerFourButtonColor = Color.white
                continueButtonColor = Color.green
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerThreeButtonColor)
                    Text("Player 3").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(playerThreeButtonDisabled)
            
            Button(action: {
                personalPlayer = 4
                playerOneButtonColor = Color.white
                playerTwoButtonColor = Color.white
                playerThreeButtonColor = Color.white
                playerFourButtonColor = Color.green
                continueButtonColor = Color.green
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerFourButtonColor)
                    Text("Player 4").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(playerFourButtonDisabled)
            
            
            NavigationLink(destination: SPHoleCount()){
                
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(continueButtonColor)
                    Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }.padding(.top, 100).disabled(continueButtonDisabled)
            
            
        }.frame(width: 350, height: 750)
    }
}

struct SPPlayerCount_Previews: PreviewProvider {
    static var previews: some View {
        SPPersonalPlayer()
    }
}

