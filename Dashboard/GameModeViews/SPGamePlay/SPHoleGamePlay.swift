//
//  SPHoleGamePlay.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

var holeNum = 1
var gameDone = false


struct SPParForHole: View{
    
    @State var par = 0
    @State var noParSelected = true
    @State var continueButtonColor = Color.white
    
    
    var body: some View{
        NavigationStack{
            VStack{
                
                Text("Hole " + String(holeNum) + " par").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
                
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
                        
                        
                    }.frame(width: 120, height: 100)
                    
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
            
        }.navigationTitle("Hole " + String(holeNum)).navigationBarBackButtonHidden(true)
    }
    
    func getPar() -> Int{
        return par
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
    }
}



var playerOneStrokes = 0
var playerTwoStrokes = 0
var playerThreeStrokes = 0
var playerFourStrokes = 0

struct SPHoleGamePlay: View {

    @State var numOfPlayers = SPPlayerCount().getNumOfPlayers()
    @State var numOfHoles = SPHoleCount().getNumOfHoles()
    @State var numOfStrokes = 0
    @State var parNum = SPParForHole().getPar()
    
    @State var playerOneTabColor = Color.green
    @State var playerTwoTabColor = Color.gray
    @State var playerThreeTabColor = Color.gray
    @State var playerFourTabColor = Color.gray
    
    @State var currentPlayer = 1
    
    @State var noPrevPlayer = true
    @State var noNextPlayer = false
    
    @State var notReadyForNextHole = true
    @State var nextHoleButtonColor = Color.white
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack(spacing: 0){
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(playerOneTabColor)
                        Text(PLAYER_ONE.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).foregroundColor(playerTwoTabColor)
                        Text(PLAYER_TWO.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).foregroundColor(playerThreeTabColor)
                        Text(PLAYER_THREE.getPlayerName()).foregroundColor(Color.white)
                            .fontDesign(.rounded)
                    }
                    ZStack{
                        Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(playerFourTabColor)
                        Text(PLAYER_FOUR.getPlayerName()).foregroundColor(Color.white)
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
                                playerOneStrokes -= 1
                            } else if currentPlayer == 2{
                                playerTwoStrokes -= 1
                            } else if currentPlayer == 3{
                                playerThreeStrokes -= 1
                            } else if currentPlayer == 4{
                                playerFourStrokes -= 1
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
                            playerOneStrokes += 1
                        } else if currentPlayer == 2{
                            playerTwoStrokes += 1
                        } else if currentPlayer == 3{
                            playerThreeStrokes += 1
                        } else if currentPlayer == 4{
                            playerFourStrokes += 1
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
        }.navigationTitle("Hole " + String(holeNum)).navigationBarBackButtonHidden(true)
    }
    
    func getPlayerStrokes(playerNum: Int) -> Int{
        if playerNum == 1{
            return playerOneStrokes
        } else if playerNum == 2{
            return playerTwoStrokes
        } else if playerNum == 3{
            return playerThreeStrokes
        } else if playerNum == 4{
            return playerFourStrokes
        } else {
            return 1000
        }
    }
    
    func nextHole() -> Void{
        
        if numOfPlayers == 1{
            
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerOneStrokes)
            
        } else if numOfPlayers == 2{
            
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerOneStrokes)
            
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerTwoStrokes)
            
        } else if numOfPlayers == 3{
            
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerOneStrokes)
            
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerTwoStrokes)
            
            PLAYER_THREE.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_THREE.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_THREE.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerThreeStrokes)
            
        } else {
            
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_ONE.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerOneStrokes)
            
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_TWO.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerTwoStrokes)
            
            PLAYER_THREE.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_THREE.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_THREE.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerThreeStrokes)
            
            PLAYER_FOUR.getGolfHole(holeIndex: holeNum - 1).setHoleNumber(holeNum: holeNum)
            PLAYER_FOUR.getGolfHole(holeIndex: holeNum - 1).setParNumber(parNum: parNum)
            PLAYER_FOUR.getGolfHole(holeIndex: holeNum - 1).setPlayerStrokes(strokeNum: playerFourStrokes)
        }
        
        resetHole()
        
        if holeNum < numOfHoles - 1{
            holeNum += 1
        } else {
            holeNum += 1
            gameDone = true
        }
    }
    
    func resetHole() -> Void{
        playerOneStrokes = 0
        playerTwoStrokes = 0
        playerThreeStrokes = 0
        playerFourStrokes = 0
        
        playerOneTabColor = Color.green
        playerTwoTabColor = Color.gray
        playerThreeTabColor = Color.gray
        playerFourTabColor = Color.gray
        
        currentPlayer = 1
        
        noPrevPlayer = true
        noNextPlayer = false
        
        notReadyForNextHole = true
        
        numOfStrokes = 0
        
        SPParForHole().setPar(newValue: 0)
    }
    
    func nextPlayer() -> Void{
        
        if currentPlayer != numOfPlayers{
            currentPlayer += 1
        }
        
        if currentPlayer == numOfPlayers{
            noNextPlayer = true
        } else {
            noNextPlayer = false
        }
        
        if currentPlayer == 1{
            noPrevPlayer = true
            numOfStrokes = playerOneStrokes
            playerOneTabColor = Color.green
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
        } else if currentPlayer == 2{
            noPrevPlayer = false
            numOfStrokes = playerTwoStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.green
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
        } else if currentPlayer == 3{
            noPrevPlayer = false
            numOfStrokes = playerThreeStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.green
            playerFourTabColor = Color.gray
        } else {
            noPrevPlayer = false
            numOfStrokes = playerFourStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.green
        }
        
    }
    
    func prevPlayer() -> Void {
        
        if currentPlayer != 1{
            currentPlayer -= 1
        }
        
        if currentPlayer == numOfPlayers{
            noNextPlayer = true
        } else {
            noNextPlayer = false
        }
        
        if currentPlayer == 1{
            noPrevPlayer = true
            numOfStrokes = playerOneStrokes
            playerOneTabColor = Color.green
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
        } else if currentPlayer == 2{
            noPrevPlayer = false
            numOfStrokes = playerTwoStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.green
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.gray
        } else if currentPlayer == 3{
            noPrevPlayer = false
            numOfStrokes = playerThreeStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.green
            playerFourTabColor = Color.gray
        } else {
            noPrevPlayer = false
            numOfStrokes = playerFourStrokes
            playerOneTabColor = Color.gray
            playerTwoTabColor = Color.gray
            playerThreeTabColor = Color.gray
            playerFourTabColor = Color.green
        }
    }
    
    func getCurrentPlayersName() -> String{
        if currentPlayer == 1{
            return PLAYER_ONE.getPlayerName()
        } else if currentPlayer == 2{
            return PLAYER_TWO.getPlayerName()
        } else if currentPlayer == 3{
            return PLAYER_THREE.getPlayerName()
        } else {
            return PLAYER_FOUR.getPlayerName()
        }
    }
    
    func isReadyForNextHole() -> Void{
        if numOfPlayers == 1 && playerOneStrokes > 0 {
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
        } else if numOfPlayers == 2 && playerOneStrokes > 0 && playerTwoStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
            
        } else if numOfPlayers == 3 && playerOneStrokes > 0 && playerTwoStrokes > 0 && playerThreeStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
            
        } else if numOfPlayers == 4 && playerOneStrokes > 0 && playerTwoStrokes > 0 && playerThreeStrokes > 0 && playerFourStrokes > 0{
            notReadyForNextHole = false
            nextHoleButtonColor = Color.green
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
            
            
            NavigationLink(destination: PlayView().onAppear(perform: SPHoleGamePlay().resetHole)){
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
                Text("Hole " + String(holeNum) + " complete").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black).padding()
                
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
                        if numOfPlayers >= 2{
                            HStack{
                                Text(String(SPHoleGamePlay().getPlayerStrokes(playerNum: 2)) + " Player Two Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        if numOfPlayers >= 3{
                            HStack{
                                Text(String(SPHoleGamePlay().getPlayerStrokes(playerNum: 3)) + " Player Three Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        if numOfPlayers == 4{
                            HStack{
                                Text(String(SPHoleGamePlay().getPlayerStrokes(playerNum: 4)) + " Player Four Strokes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                                Spacer()
                            }
                        }
                        
                        
                        Spacer()
                        
                        Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                        
                    }.frame(width: 290, height: 370)
                }.padding()
                
                if gameDone == false{
                    NavigationLink(destination: SPParForHole()){
                        ZStack{
                            Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.green)
                            Text("Continue").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        }
                    }.padding()
                    
                } else if gameDone == true{
                    NavigationLink(destination: SPGameScoreCard()){
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
struct SPHoleGamePlay_Previews: PreviewProvider {
    static var previews: some View {
        SPGameScoreCard()
    }
}


