//
//  StrokePlayGameView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-06.
//

import SwiftUI

struct SPPlayerCount: View {
    
    @State var numOfPlayers = 0
    @State var noPlayersSelected = true
    
    
    
    @State var buttonOneColor = Color.white
    @State var buttonTwoColor = Color.white
    @State var buttonThreeColor = Color.white
    @State var buttonFourColor = Color.white
    
    @State var continueButtonColor = Color.gray
    
    
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
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonFourColor)
                            Text("4").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                }
            }
            
            
            NavigationLink(destination: SPHoleCount()){
                
                ZStack{
                    Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(continueButtonColor)
                    Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                    
                }
            }.padding(.top, 200).disabled(noPlayersSelected)
            
            
        }.frame(width: 350, height: 750)
    }
}

struct SPPlayerCount_Previews: PreviewProvider {
    static var previews: some View {
        SPPlayerCount()
    }
}
