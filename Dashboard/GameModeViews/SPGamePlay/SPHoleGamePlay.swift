//
//  SPHoleGamePlay.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

var holeNum = 1


struct parForHole: View{
    
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





struct SPHoleGamePlay: View {

    @State var numOfPlayers = SPPlayerCount().getNumOfPlayers()
    @State var numOfHoles = SPHoleCount().getNumOfHoles()
    @State var numOfStrokes = 0
    @State var parNum = parForHole().getPar()
    
    @State var playerOneStrokes = 0
    @State var playerTwoStrokes = 0
    @State var playerThreeStrokes = 0
    @State var playerFourStrokes = 0
    
    @State var playerOneTabColor = Color.green
    @State var playerTwoTabColor = Color.gray
    @State var playerThreeTabColor = Color.gray
    @State var playerFourTabColor = Color.gray
    
    @State var currentPlayer = 1
    
    @State var noPrevPlayer = true
    @State var noNextPlayer = false
    
    @State var readyForNextHole = false
    
    
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
                Button(action:{
                    nextHole()
                }, label: {
                    ZStack{
                            Rectangle().frame(width: 350, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("Next hole").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                    }
                })
                    
                
                Button(action:{
                    
                }, label: {
                    ZStack{
                        Rectangle().frame(width: 350, height: 60).cornerRadius(5).shadow(radius: 3).foregroundColor(.red)
                        Text("End game").fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                    }
                }).padding()
                
            }
        }.navigationTitle("Hole " + String(holeNum))
    }
    
    func nextHole() -> Void{
        if numOfPlayers == 1{
            var GOLF_HOLE = SPGolfHole(holeNumber: holeNum, parNumber: parNum, playerStrokes: playerOneStrokes)
            PLAYER_ONE.addGolfHole(golfHole: GOLF_HOLE)
        } else if numOfPlayers == 2{
            
        }
        
        resetHole()
        
        if holeNum < numOfHoles{
            holeNum += 1
            // add navigation link
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
        
        readyForNextHole = false
        
        numOfStrokes = 0
        
        parForHole().setPar(newValue: 0)
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
}


struct SPHoleGamePlay_Previews: PreviewProvider {
    static var previews: some View {
        SPHoleGamePlay()
    }
}


