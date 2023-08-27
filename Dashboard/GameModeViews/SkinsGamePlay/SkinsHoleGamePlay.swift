//
//  SkinsHoleGamePlay.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-14.
//

import SwiftUI

var skinsHoleNum = 1
var skinsGameDone = false
var skinsParNum = 0
var numOfSkinsAvailable = 0

struct SkinsParForHole: View{
    
    @State var par = 0
    @State var noParSelected = true
    @State var continueButtonColor = Color.white
    
    
    var body: some View{
        NavigationStack{
            VStack{
                
                Text("Hole " + String(skinsHoleNum) + " par").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
                
                HStack{
                    Button(action:{
                        if par >= 1{
                            par -= 1
                        }
                        checkValidPar()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("-").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                            
                        }
                    })
                    
                    ZStack{
                        Rectangle().cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                        Text(String(par) ).fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                        
                        
                    }.frame(width: 100, height: 100)
                    
                    Button(action:{
                        par += 1
                        checkValidPar()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("+").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                            
                        }
                    })
                }
                
                NavigationLink(destination: SkinsHoleGamePlay()){
                    
                    ZStack{
                        Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(continueButtonColor)
                        Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        
                    }
                }.padding(.top, 200).disabled(noParSelected)
            }
            
        }.navigationTitle("Hole " + String(skinsHoleNum)).navigationBarBackButtonHidden(true)
    }
    
    func setPar(newValue: Int) -> Void{
        par = newValue
    }
    
    func checkValidPar() -> Void{
        if par > 0{
            noParSelected = false
            continueButtonColor = Color.green
        } else{
            noParSelected = true
            continueButtonColor = Color.white
        }
        
        skinsParNum = par
    }
}



var skinsPlayerOneStrokes = 0
var skinsPlayerTwoStrokes = 0
var skinsPlayerThreeStrokes = 0
var skinsPlayerFourStrokes = 0

struct SkinsHoleGamePlay: View {

    @State var numOfPlayers = SkinsPlayerCount().getNumOfPlayers()
    @State var numOfHoles = SkinsHoleCount().getNumOfHoles()
    @State var numOfStrokes = 0
    
    @State var playerOneTabColor = Color.green
    @State var playerTwoTabColor = Color.gray
    @State var playerThreeTabColor = Color.gray
    @State var playerFourTabColor = Color.gray
    
    @State var currentPlayer = 1
    
    @State var noPrevPlayer = true
    @State var noNextPlayer = SkinsPlayerCount().isOnePlayer()
    
    @State var notReadyForNextHole = true
    @State var nextHoleButtonColor = Color.white
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack(spacing: 0){
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(playerOneTabColor)
                        Text(SKINS_PLAYER_ONE.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).foregroundColor(playerTwoTabColor)
                        Text(SKINS_PLAYER_TWO.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).foregroundColor(playerThreeTabColor)
                        Text(SKINS_PLAYER_THREE.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(playerFourTabColor)
                        Text(SKINS_PLAYER_FOUR.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                }.padding()
                
                Text(getCurrentPlayersName() + "'s turn").fontDesign(.rounded).bold().font(.system(size: 30))
                Spacer()
                
                
                
                HStack{
                    Button(action:{
                        if numOfStrokes >= 1{
                            numOfStrokes -= 1
                            if currentPlayer == 1{
                                skinsPlayerOneStrokes -= 1
                            } else if currentPlayer == 2{
                                skinsPlayerTwoStrokes -= 1
                            } else if currentPlayer == 3{
                                skinsPlayerThreeStrokes -= 1
                            } else if currentPlayer == 4{
                                skinsPlayerFourStrokes -= 1
                            }
                        }
                        
                        isReadyForNextHole()
                        
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 70, height: 80).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("-").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                            
                        }
                    })
                    
                    ZStack{
                        Rectangle().cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                        Text("Stroke " + String(numOfStrokes) ).fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                        
                        
                    }.frame(width: 180, height: 80)
                    
                    Button(action:{
                        numOfStrokes += 1
                        if currentPlayer == 1{
                            skinsPlayerOneStrokes += 1
                        } else if currentPlayer == 2{
                            skinsPlayerTwoStrokes += 1
                        } else if currentPlayer == 3{
                            skinsPlayerThreeStrokes += 1
                        } else if currentPlayer == 4{
                            skinsPlayerFourStrokes += 1
                        }
                        
                        isReadyForNextHole()
                        
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 80, height: 80).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("+").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                            
                        }
                    })
                    
                }
                
                HStack{
                    Button(action:{
                        prevPlayer()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 170, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("Previous player").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                        }
                    }).disabled(noPrevPlayer)
                    
                    
                    Button(action:{
                        nextPlayer()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 170, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("Next player").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                        }
                    }).disabled(noNextPlayer)
                    
                }.padding()
                
                Spacer()
                
                NavigationLink(destination: SkinsPreviousHoleStats().onAppear(perform: nextHole)){
                    ZStack{
                        Rectangle().frame(width: 350, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(nextHoleButtonColor)
                        Text("Next hole").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                    }
                }.disabled(notReadyForNextHole)
                
                NavigationLink(destination: SkinsEndGame()){
                    ZStack{
                        Rectangle().frame(width: 350, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(.red)
                        Text("End game").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                    }.padding()
                    
                }
            }
        }.navigationTitle("Hole " + String(skinsHoleNum)).navigationBarBackButtonHidden(true)
    }
    
    func getPlayerStrokes(playerNum: Int) -> Int{
        if playerNum == 1{
            return skinsPlayerOneStrokes
        } else if playerNum == 2{
            return skinsPlayerTwoStrokes
        } else if playerNum == 3{
            return skinsPlayerThreeStrokes
        } else if playerNum == 4{
            return skinsPlayerFourStrokes
        } else {
            return 0
        }
    }
    
    func nextHole() -> Void{
        
        if numOfPlayers == 1{
            
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerOneStrokes)
            
        } else if numOfPlayers == 2{
            
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerOneStrokes)
            
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerTwoStrokes)
            
        } else if numOfPlayers == 3{
            
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerOneStrokes)
            
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerTwoStrokes)
            
            SKINS_PLAYER_THREE.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_THREE.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_THREE.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerThreeStrokes)
            
        } else {
            
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_ONE.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerOneStrokes)
            
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_TWO.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerTwoStrokes)
            
            SKINS_PLAYER_THREE.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_THREE.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_THREE.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerThreeStrokes)
            
            SKINS_PLAYER_FOUR.getGolfHole(holeIndex: skinsHoleNum - 1).setHoleNumber(holeNum: skinsHoleNum)
            SKINS_PLAYER_FOUR.getGolfHole(holeIndex: skinsHoleNum - 1).setParNumber(parNum: skinsParNum)
            SKINS_PLAYER_FOUR.getGolfHole(holeIndex: skinsHoleNum - 1).setPlayerStrokes(strokeNum: skinsPlayerFourStrokes)
        }
        
        if getPlayerStrokes(playerNum: 1) < getPlayerStrokes(playerNum: 2) && getPlayerStrokes(playerNum: 1) < getPlayerStrokes(playerNum: 3) && getPlayerStrokes(playerNum: 1) < getPlayerStrokes(playerNum: 4){
            
            SKINS_PLAYER_ONE.addToSkinsWon()
            
            
            
        } else if getPlayerStrokes(playerNum: 2) < getPlayerStrokes(playerNum: 1) && getPlayerStrokes(playerNum: 2) < getPlayerStrokes(playerNum: 3) && getPlayerStrokes(playerNum: 2) < getPlayerStrokes(playerNum: 4){
            
            SKINS_PLAYER_TWO.addToSkinsWon()
            
            
        } else if getPlayerStrokes(playerNum: 3) < getPlayerStrokes(playerNum: 1) && getPlayerStrokes(playerNum: 3) < getPlayerStrokes(playerNum: 2) && getPlayerStrokes(playerNum: 3) < getPlayerStrokes(playerNum: 4){
            
            SKINS_PLAYER_THREE.addToSkinsWon()
            
            
        } else if getPlayerStrokes(playerNum: 4) < getPlayerStrokes(playerNum: 1) && getPlayerStrokes(playerNum: 4) < getPlayerStrokes(playerNum: 2) && getPlayerStrokes(playerNum: 4) < getPlayerStrokes(playerNum: 3){
            
            SKINS_PLAYER_FOUR.addToSkinsWon()
            
            
        }
        
        resetHole()
        
        if skinsHoleNum < numOfHoles - 1{
            skinsHoleNum += 1
        } else {
            skinsHoleNum += 1
            skinsGameDone = true
        }
    }
    
    func resetHole() -> Void{
        skinsPlayerOneStrokes = 0
        skinsPlayerTwoStrokes = 0
        skinsPlayerThreeStrokes = 0
        skinsPlayerFourStrokes = 0
        
        playerOneTabColor = Color.green
        playerTwoTabColor = Color.gray
        playerThreeTabColor = Color.gray
        playerFourTabColor = Color.gray
        
        currentPlayer = 1
        
        noPrevPlayer = true
        noNextPlayer = false
        
        notReadyForNextHole = true
        
        numOfStrokes = 0
        
        SkinsParForHole().setPar(newValue: 0)
        
        skinsParNum = 0
        
    }
    
    func nextPlayer() -> Void{
        
        if currentPlayer != numOfPlayers{
            currentPlayer += 1
        }
        
        
        
        if currentPlayer == 1{
            noPrevPlayer = true
            numOfStrokes = skinsPlayerOneStrokes
            playerOneTabColor = Color.green
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
            if numOfPlayers == 1{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        } else if currentPlayer == 2{
            noPrevPlayer = false
            numOfStrokes = skinsPlayerTwoStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.green
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
            if numOfPlayers == 2{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        } else if currentPlayer == 3{
            noPrevPlayer = false
            numOfStrokes = skinsPlayerThreeStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.green
            playerFourTabColor = Color.gray
            if numOfPlayers == 3{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        } else {
            noPrevPlayer = false
            numOfStrokes = skinsPlayerFourStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.green
            if numOfPlayers == 4{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        }
        
    }
    
    func prevPlayer() -> Void {
        
        if currentPlayer != 1{
            currentPlayer -= 1
        }
        
        if currentPlayer == 1{
            noPrevPlayer = true
            numOfStrokes = skinsPlayerOneStrokes
            playerOneTabColor = Color.green
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
            if numOfPlayers == 1{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        } else if currentPlayer == 2{
            noPrevPlayer = false
            numOfStrokes = skinsPlayerTwoStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.green
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
            if numOfPlayers == 2{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        } else if currentPlayer == 3{
            noPrevPlayer = false
            numOfStrokes = skinsPlayerThreeStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.green
            playerFourTabColor = Color.gray
            if numOfPlayers == 3{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        } else {
            noPrevPlayer = false
            numOfStrokes = skinsPlayerFourStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.green
            if numOfPlayers == 4{
                noNextPlayer = true
            } else {
                noNextPlayer = false
            }
        }
    }
    
    func getCurrentPlayersName() -> String{
        if currentPlayer == 1{
            return SKINS_PLAYER_ONE.getPlayerName()
        } else if currentPlayer == 2{
            return SKINS_PLAYER_TWO.getPlayerName()
        } else if currentPlayer == 3{
            return SKINS_PLAYER_THREE.getPlayerName()
        } else {
            return SKINS_PLAYER_FOUR.getPlayerName()
        }
    }
    
    func isReadyForNextHole() -> Void{
        if numOfPlayers == 1 && skinsPlayerOneStrokes > 0 {
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
        } else if numOfPlayers == 2 && skinsPlayerOneStrokes > 0 && skinsPlayerTwoStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
            
        } else if numOfPlayers == 3 && skinsPlayerOneStrokes > 0 && skinsPlayerTwoStrokes > 0 && skinsPlayerThreeStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
            
        } else if numOfPlayers == 4 && skinsPlayerOneStrokes > 0 && skinsPlayerTwoStrokes > 0 && skinsPlayerThreeStrokes > 0 && skinsPlayerFourStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
        } else {
            notReadyForNextHole = true
            nextHoleButtonColor = Color.white
        }
    }
    
}

struct SkinsEndGame: View{
    
    var body: some View {
        VStack{
            
            Image(systemName: "rectangle.portrait.and.arrow.forward").resizable().frame(width: 80, height: 80).bold().padding().padding(.leading, 20)
            Text("End current golf game").font(.system(size: 20))
            
            
            NavigationLink(destination: PlayView().onAppear(perform: SkinsGameScoreCard().resetGame)){
                Text("End game").frame(width: 150, height: 40).foregroundColor(.white).background(Color.red).cornerRadius(5)
            }.padding()
            
            HStack{
                Image(systemName: "exclamationmark.circle")
                Text("Statistics from the current game will not be saved once the game is ended.")
            }.padding()
        }
    }
}

struct SkinsPreviousHoleStats: View{
    
    
    var body: some View{
        NavigationStack{
            VStack{
                Text("Hole " + String(skinsHoleNum) + " complete").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black).padding()
                
                ZStack{
                    
                    Rectangle().foregroundColor(Color.white).frame(width: 320, height: 400).cornerRadius(5).shadow(radius: 5)
                    VStack{
                        HStack{
                            Text("Par").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }.padding(.bottom)
                        HStack{
                            Text(String(SkinsHoleGamePlay().getPlayerStrokes(playerNum: 1)) + " Player One strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }
                        if SkinsNumOfPlayers >= 2{
                            HStack{
                                Text(String(SkinsHoleGamePlay().getPlayerStrokes(playerNum: 2)) + " Player Two Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        if SkinsNumOfPlayers >= 3{
                            HStack{
                                Text(String(SkinsHoleGamePlay().getPlayerStrokes(playerNum: 3)) + " Player Three Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        if SkinsNumOfPlayers == 4{
                            HStack{
                                Text(String(SkinsHoleGamePlay().getPlayerStrokes(playerNum: 4)) + " Player Four Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                        
                        Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                        
                    }.frame(width: 290, height: 370)
                }.padding()
                 
                if skinsGameDone == false{
                    NavigationLink(destination: SkinsParForHole()){
                        ZStack{
                            Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.green)
                            Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        }
                    }.padding()
                    
                } else if skinsGameDone == true{
                    NavigationLink(destination: SkinsViewTotalPlayerScores()){
                        ZStack{
                            Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.green)
                            Text("Finish").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        }
                    }.padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}






struct SkinsViewTotalPlayerScores: View{
    var body: some View{
        
            NavigationStack{
                VStack{
                    Text("Game complete").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black).padding()
                    
                    ZStack{
                        
                        Rectangle().foregroundColor(Color.white).frame(width: 320, height: 400).cornerRadius(5).shadow(radius: 5)
                        VStack{
                            HStack{
                                Text("Skins won by players").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }.padding(.bottom)
                            HStack{
                                Text("Player One won " + String(SKINS_PLAYER_ONE.getSkinsWon()) + " skins").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                            if SkinsNumOfPlayers >= 2{
                                HStack{
                                    Text("Player Two won " + String(SKINS_PLAYER_TWO.getSkinsWon()) + " skins").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                            if SkinsNumOfPlayers >= 3{
                                HStack{
                                    Text("Player Three won " + String(SKINS_PLAYER_THREE.getSkinsWon()) + " skins").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                            if SkinsNumOfPlayers == 4{
                                HStack{
                                    Text("Player Four won " + String(SKINS_PLAYER_FOUR.getSkinsWon()) + " skins").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                            
                            Spacer()
                            
                            Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                            
                        }.frame(width: 290, height: 370)
                    }.padding()
                    
                        NavigationLink(destination: SkinsGameScoreCard()){
                            ZStack{
                                Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.green)
                                Text("Scorecard").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                            }
                        }.padding()
                    
                }
            }.navigationBarBackButtonHidden(true)
        }
}


struct SkinsHoleGamePlay_Previews: PreviewProvider {
    static var previews: some View {
        SkinsHoleGamePlay()
    }
}
