//
//  SPHoleGamePlay.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

var SPHoleNum = 1
var SPGameDone = false
var SPParNum = 0

struct SPParForHole: View{
    
    @State var par = 0
    @State var noParSelected = true
    @State var continueButtonColor = Color.white
    
    
    var body: some View{
        NavigationStack{
            VStack{
                
                Text("Hole " + String(SPHoleNum) + " par").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
                
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
                
                NavigationLink(destination: SPHoleGamePlay()){
                    
                    ZStack{
                        Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(continueButtonColor)
                        Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        
                    }
                }.padding(.top, 200).disabled(noParSelected)
            }
            
        }.navigationTitle("Hole " + String(SPHoleNum)).navigationBarBackButtonHidden(true)
    }
    
    func setPar(newValue: Int) -> Void{
        par = newValue
    }
    
    func checkValidPar() -> Void{
        if par > 0{
            noParSelected = false
            continueButtonColor = Color.yellow
        } else{
            noParSelected = true
            continueButtonColor = Color.white
        }
        
        SPParNum = par
    }
}



var SPPlayerOneStrokes = 0
var SPPlayerTwoStrokes = 0
var SPPlayerThreeStrokes = 0
var SPPlayerFourStrokes = 0

struct SPHoleGamePlay: View {

    @State var numOfPlayers = SPPlayerCount().getNumOfPlayers()
    @State var numOfHoles = SPHoleCount().getNumOfHoles()
    @State var numOfStrokes = 0
    
    @State var playerOneTabColor = Color.yellow
    @State var playerTwoTabColor = Color.gray
    @State var playerThreeTabColor = Color.gray
    @State var playerFourTabColor = Color.gray
    
    @State var currentPlayer = 1
    
    @State var noPrevPlayer = true
    @State var noNextPlayer = SPPlayerCount().isOnePlayer()
    
    @State var notReadyForNextHole = true
    @State var nextHoleButtonColor = Color.white
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack(spacing: 0){
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(playerOneTabColor)
                        Text(SP_PLAYER_ONE.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).foregroundColor(playerTwoTabColor)
                        Text(SP_PLAYER_TWO.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).foregroundColor(playerThreeTabColor)
                        Text(SP_PLAYER_THREE.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(playerFourTabColor)
                        Text(SP_PLAYER_FOUR.getPlayerName()).foregroundColor(Color.white)
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
                                SPPlayerOneStrokes -= 1
                            } else if currentPlayer == 2{
                                SPPlayerTwoStrokes -= 1
                            } else if currentPlayer == 3{
                                SPPlayerThreeStrokes -= 1
                            } else if currentPlayer == 4{
                                SPPlayerFourStrokes -= 1
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
                            SPPlayerOneStrokes += 1
                        } else if currentPlayer == 2{
                            SPPlayerTwoStrokes += 1
                        } else if currentPlayer == 3{
                            SPPlayerThreeStrokes += 1
                        } else if currentPlayer == 4{
                            SPPlayerFourStrokes += 1
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
                
                NavigationLink(destination: SPPreviousHoleStats().onAppear(perform: nextHole)){
                    ZStack{
                        Rectangle().frame(width: 350, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(nextHoleButtonColor)
                        Text("Next hole").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                    }
                }.disabled(notReadyForNextHole)
                
                NavigationLink(destination: SPEndGame()){
                    ZStack{
                        Rectangle().frame(width: 350, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(.red)
                        Text("End game").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                    }.padding()
                    
                }
            }
        }.navigationTitle("Hole " + String(SPHoleNum)).navigationBarBackButtonHidden(true)
    }
    
    func getPlayerStrokes(playerNum: Int) -> Int{
        if playerNum == 1{
            return SPPlayerOneStrokes
        } else if playerNum == 2{
            return SPPlayerTwoStrokes
        } else if playerNum == 3{
            return SPPlayerThreeStrokes
        } else if playerNum == 4{
            return SPPlayerFourStrokes
        } else {
            return 0
        }
    }
    
    func nextHole() -> Void{
        
        if numOfPlayers == 1{
            
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerOneStrokes)
            
        } else if numOfPlayers == 2{
            
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerOneStrokes)
            
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerTwoStrokes)
            
        } else if numOfPlayers == 3{
            
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerOneStrokes)
            
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerTwoStrokes)
            
            SP_PLAYER_THREE.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_THREE.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_THREE.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerThreeStrokes)
            
        } else {
            
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_ONE.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerOneStrokes)
            
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_TWO.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerTwoStrokes)
            
            SP_PLAYER_THREE.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_THREE.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_THREE.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerThreeStrokes)
            
            SP_PLAYER_FOUR.getGolfHole(holeIndex: SPHoleNum - 1).setHoleNumber(holeNum: SPHoleNum)
            SP_PLAYER_FOUR.getGolfHole(holeIndex: SPHoleNum - 1).setParNumber(parNum: SPParNum)
            SP_PLAYER_FOUR.getGolfHole(holeIndex: SPHoleNum - 1).setPlayerStrokes(strokeNum: SPPlayerFourStrokes)
        }
        
        resetHole()
        
        if SPHoleNum < numOfHoles - 1{
            SPHoleNum += 1
        } else {
            SPHoleNum += 1
            SPGameDone = true
        }
    }
    
    func resetHole() -> Void{
        SPPlayerOneStrokes = 0
        SPPlayerTwoStrokes = 0
        SPPlayerThreeStrokes = 0
        SPPlayerFourStrokes = 0
        
        playerOneTabColor = Color.yellow
        playerTwoTabColor = Color.gray
        playerThreeTabColor = Color.gray
        playerFourTabColor = Color.gray
        
        currentPlayer = 1
        
        noPrevPlayer = true
        noNextPlayer = false
        
        notReadyForNextHole = true
        
        numOfStrokes = 0
        
        SPParForHole().setPar(newValue: 0)
        
        SPParNum = 0
    }
    
    func nextPlayer() -> Void{
        
        if currentPlayer != numOfPlayers{
            currentPlayer += 1
        }
        
        
        
        if currentPlayer == 1{
            noPrevPlayer = true
            numOfStrokes = SPPlayerOneStrokes
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
            numOfStrokes = SPPlayerTwoStrokes
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
            numOfStrokes = SPPlayerThreeStrokes
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
            numOfStrokes = SPPlayerFourStrokes
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
            numOfStrokes = SPPlayerOneStrokes
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
            numOfStrokes = SPPlayerTwoStrokes
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
            numOfStrokes = SPPlayerThreeStrokes
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
            numOfStrokes = SPPlayerFourStrokes
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
            return SP_PLAYER_ONE.getPlayerName()
        } else if currentPlayer == 2{
            return SP_PLAYER_TWO.getPlayerName()
        } else if currentPlayer == 3{
            return SP_PLAYER_THREE.getPlayerName()
        } else {
            return SP_PLAYER_FOUR.getPlayerName()
        }
    }
    
    func isReadyForNextHole() -> Void{
        if numOfPlayers == 1 && SPPlayerOneStrokes > 0 {
            notReadyForNextHole = false
            nextHoleButtonColor = Color.yellow
        } else if numOfPlayers == 2 && SPPlayerOneStrokes > 0 && SPPlayerTwoStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.yellow
            
        } else if numOfPlayers == 3 && SPPlayerOneStrokes > 0 && SPPlayerTwoStrokes > 0 && SPPlayerThreeStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.yellow
            
        } else if numOfPlayers == 4 && SPPlayerOneStrokes > 0 && SPPlayerTwoStrokes > 0 && SPPlayerThreeStrokes > 0 && SPPlayerFourStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.yellow
        } else {
            notReadyForNextHole = true
            nextHoleButtonColor = Color.white
        }
    }
}

struct SPEndGame: View{
    
    var body: some View {
        VStack{
            
            Image(systemName: "rectangle.portrait.and.arrow.forward").resizable().frame(width: 80, height: 80).bold().padding().padding(.leading, 20)
            Text("End current golf game").font(.system(size: 20))
            
            
            NavigationLink(destination: PlayView().onAppear(perform: SPGameScoreCard().resetGame)){
                Text("End game").frame(width: 150, height: 40).foregroundColor(.white).background(Color.red).cornerRadius(5)
            }.padding()
            
            HStack{
                Image(systemName: "exclamationmark.circle")
                Text("Statistics from the current game will not be saved once the game is ended.")
            }.padding()
        }
    }
}

struct SPPreviousHoleStats: View{
    
    
    var body: some View{
        NavigationStack{
            VStack{
                Text("Hole " + String(SPHoleNum) + " complete").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black).padding()
                
                ZStack{
                    
                    Rectangle().foregroundColor(Color.white).frame(width: 320, height: 400).cornerRadius(5).shadow(radius: 5)
                    VStack{
                        HStack{
                            Text("Par").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }.padding(.bottom)
                        HStack{
                            Text(String(SPHoleGamePlay().getPlayerStrokes(playerNum: 1)) + " Player One strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }
                        if SPNumOfPlayers >= 2{
                            HStack{
                                Text(String(SPHoleGamePlay().getPlayerStrokes(playerNum: 2)) + " Player Two Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        if SPNumOfPlayers >= 3{
                            HStack{
                                Text(String(SPHoleGamePlay().getPlayerStrokes(playerNum: 3)) + " Player Three Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        if SPNumOfPlayers == 4{
                            HStack{
                                Text(String(SPHoleGamePlay().getPlayerStrokes(playerNum: 4)) + " Player Four Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        
                        Spacer()
                        
                        Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                        
                    }.frame(width: 290, height: 370)
                }.padding()
                
                if SPGameDone == false{
                    NavigationLink(destination: SPParForHole()){
                        ZStack{
                            Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.yellow)
                            Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        }
                    }.padding()
                    
                } else if SPGameDone == true{
                    NavigationLink(destination: SPViewTotalPlayerScores()){
                        ZStack{
                            Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.yellow)
                            Text("Finish").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        }
                    }.padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}






struct SPViewTotalPlayerScores: View{
    var body: some View{
        
            NavigationStack{
                VStack{
                    Text("Game complete").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black).padding()
                    
                    ZStack{
                        
                        Rectangle().foregroundColor(Color.white).frame(width: 320, height: 400).cornerRadius(5).shadow(radius: 5)
                        VStack{
                            HStack{
                                Text("Total player strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }.padding(.bottom)
                            HStack{
                                Text(String(SPGameScoreCard().playerOneTotalStrokes()) + " Player One strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                            if SPNumOfPlayers >= 2{
                                HStack{
                                    Text(String(SPGameScoreCard().playerTwoTotalStrokes()) + " Player Two Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                            if SPNumOfPlayers >= 3{
                                HStack{
                                    Text(String(SPGameScoreCard().playerThreeTotalStrokes()) + " Player Three Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                            if SPNumOfPlayers == 4{
                                HStack{
                                    Text(String(SPGameScoreCard().playerFourTotalStrokes()) + " Player Four Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                            
                            Spacer()
                            
                            Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                            
                        }.frame(width: 290, height: 370)
                    }.padding()
                    
                        NavigationLink(destination: SPGameScoreCard()){
                            ZStack{
                                Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.yellow)
                                Text("Scorecard").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                            }
                        }.padding()
                    
                }
            }.navigationBarBackButtonHidden(true)
        }
}
struct SPHoleGamePlay_Previews: PreviewProvider {
    static var previews: some View {
        SPViewTotalPlayerScores()
    }
}


