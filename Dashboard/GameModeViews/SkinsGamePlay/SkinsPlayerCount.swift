//
//  SkinsPlayerCount.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-14.
//

import SwiftUI

var SkinsNumOfPlayers = 0
var SkinsPlayer = 1

var SkinsPlayerOneButtonDisabled = true
var SkinsPlayerTwoButtonDisabled = true
var SkinsPlayerThreeButtonDisabled = true
var SkinsPlayerFourButtonDisabled = true

struct SkinsPlayerCount: View {
    
    
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
                        SkinsNumOfPlayers = 1
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
                        SkinsNumOfPlayers = 3
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
                        SkinsNumOfPlayers = 2
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
                        SkinsNumOfPlayers = 4
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
            
            
            NavigationLink(destination: SkinsPersonalPlayer()){
                
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(continueButtonColor)
                    Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }.padding(.top, 200).disabled(noPlayersSelected)
            
            
        }.frame(width: 350, height: 750)
    }
    
    func getNumOfPlayers() -> Int{
        return SkinsNumOfPlayers
    }
    
    func disablePlayerOptions() -> Void{
        if SkinsNumOfPlayers == 1{
            SkinsPlayerOneButtonDisabled = false
            SkinsPlayerTwoButtonDisabled = true
            SkinsPlayerThreeButtonDisabled = true
            SkinsPlayerFourButtonDisabled = true
        } else if SPNumOfPlayers == 2{
            SkinsPlayerOneButtonDisabled = false
            SkinsPlayerTwoButtonDisabled = false
            SkinsPlayerThreeButtonDisabled = true
            SkinsPlayerFourButtonDisabled = true
        } else if SPNumOfPlayers == 3{
            SkinsPlayerOneButtonDisabled = false
            SkinsPlayerTwoButtonDisabled = false
            SkinsPlayerThreeButtonDisabled = false
            SkinsPlayerFourButtonDisabled = true
        } else if SPNumOfPlayers == 4{
            SkinsPlayerOneButtonDisabled = false
            SkinsPlayerTwoButtonDisabled = false
            SkinsPlayerThreeButtonDisabled = false
            SkinsPlayerFourButtonDisabled = false
        }
    }
}












struct SkinsPersonalPlayer: View{
    
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
                SkinsPlayer = 1
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
            }).padding().disabled(SkinsPlayerOneButtonDisabled)
            
            Button(action: {
                SkinsPlayer = 2
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
            }).padding().disabled(SkinsPlayerTwoButtonDisabled)
            
            Button(action: {
                SkinsPlayer = 3
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
            }).padding().disabled(SkinsPlayerThreeButtonDisabled)
            
            Button(action: {
                SkinsPlayer = 4
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
            }).padding().disabled(SkinsPlayerFourButtonDisabled)
            
            
            NavigationLink(destination: SkinsHoleCount()){
                
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(continueButtonColor)
                    Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }.padding(.top, 100).disabled(continueButtonDisabled)
            
            
        }.frame(width: 350, height: 750)
    }
}






struct SkinsPlayerCount_Previews: PreviewProvider {
    static var previews: some View {
        SkinsPlayerCount()
    }
}
