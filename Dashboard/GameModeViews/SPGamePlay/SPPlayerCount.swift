//
//  StrokePlayGameView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-06.
//

import SwiftUI

var SPNumOfPlayers = 0
var SPPlayer = 1

var SPPlayerOneButtonDisabled = true
var SPPlayerTwoButtonDisabled = true
var SPPlayerThreeButtonDisabled = true
var SPPlayerFourButtonDisabled = true

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
                        SPNumOfPlayers = 1
                        buttonOneColor = Color.yellow
                        buttonTwoColor = Color.white
                        buttonThreeColor = Color.white
                        buttonFourColor = Color.white
                        continueButtonColor = Color.yellow
                        disablePlayerOptions()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonOneColor)
                            Text("1").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    Button(action: {
                        noPlayersSelected = false
                        SPNumOfPlayers = 3
                        buttonOneColor = Color.white
                        buttonTwoColor = Color.white
                        buttonThreeColor = Color.yellow
                        buttonFourColor = Color.white
                        continueButtonColor = Color.yellow
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
                        SPNumOfPlayers = 2
                        buttonOneColor = Color.white
                        buttonTwoColor = Color.yellow
                        buttonThreeColor = Color.white
                        buttonFourColor = Color.white
                        continueButtonColor = Color.yellow
                        disablePlayerOptions()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonTwoColor)
                            Text("2").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    Button(action: {
                        noPlayersSelected = false
                        SPNumOfPlayers = 4
                        buttonOneColor = Color.white
                        buttonTwoColor = Color.white
                        buttonThreeColor = Color.white
                        buttonFourColor = Color.yellow
                        continueButtonColor = Color.yellow
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
        return SPNumOfPlayers
    }
    
    func disablePlayerOptions() -> Void{
        if SPNumOfPlayers == 1{
            SPPlayerOneButtonDisabled = false
            SPPlayerTwoButtonDisabled = true
            SPPlayerThreeButtonDisabled = true
            SPPlayerFourButtonDisabled = true
        } else if SPNumOfPlayers == 2{
            SPPlayerOneButtonDisabled = false
            SPPlayerTwoButtonDisabled = false
            SPPlayerThreeButtonDisabled = true
            SPPlayerFourButtonDisabled = true
        } else if SPNumOfPlayers == 3{
            SPPlayerOneButtonDisabled = false
            SPPlayerTwoButtonDisabled = false
            SPPlayerThreeButtonDisabled = false
            SPPlayerFourButtonDisabled = true
        } else if SPNumOfPlayers == 4{
            SPPlayerOneButtonDisabled = false
            SPPlayerTwoButtonDisabled = false
            SPPlayerThreeButtonDisabled = false
            SPPlayerFourButtonDisabled = false
        }
    }
    
    func isOnePlayer() -> Bool{
        if SkinsNumOfPlayers == 1{
            return true
        } else {
            return false
        }
    }
}












struct SPPersonalPlayer: View{
    
    @State var continueButtonColor = Color.white
    @State var continueButtonDisabled = true
    
    @State var playerOneButtonColor = Color.white
    @State var playerTwoButtonColor = Color.white
    @State var playerThreeButtonColor = Color.white
    @State var playerFourButtonColor = Color.white
    
    var body: some View{
        VStack{
            Text("Select your player").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
            
            Button(action: {
                SPPlayer = 1
                playerOneButtonColor = Color.yellow
                playerTwoButtonColor = Color.white
                playerThreeButtonColor = Color.white
                playerFourButtonColor = Color.white
                continueButtonColor = Color.yellow
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerOneButtonColor)
                    Text("Player 1").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(SPPlayerOneButtonDisabled)
            
            Button(action: {
                SPPlayer = 2
                playerOneButtonColor = Color.white
                playerTwoButtonColor = Color.yellow
                playerThreeButtonColor = Color.white
                playerFourButtonColor = Color.white
                continueButtonColor = Color.yellow
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerTwoButtonColor)
                    Text("Player 2").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(SPPlayerTwoButtonDisabled)
            
            Button(action: {
                SPPlayer = 3
                playerOneButtonColor = Color.white
                playerTwoButtonColor = Color.white
                playerThreeButtonColor = Color.yellow
                playerFourButtonColor = Color.white
                continueButtonColor = Color.yellow
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerThreeButtonColor)
                    Text("Player 3").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(SPPlayerThreeButtonDisabled)
            
            Button(action: {
                SPPlayer = 4
                playerOneButtonColor = Color.white
                playerTwoButtonColor = Color.white
                playerThreeButtonColor = Color.white
                playerFourButtonColor = Color.yellow
                continueButtonColor = Color.yellow
                continueButtonDisabled = false
            }, label: {
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(playerFourButtonColor)
                    Text("Player 4").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }).padding().disabled(SPPlayerFourButtonDisabled)
            
            
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

