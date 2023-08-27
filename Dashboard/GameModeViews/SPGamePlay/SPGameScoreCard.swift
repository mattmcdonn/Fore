//
//  SPGameScoreCard.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-10.
//

import SwiftUI

var SPPlayerOneRectangleColor = Color.blue
var SPPlayerTwoRectangleColor = Color.teal
var SPPlayerThreeRectangleColor = Color.blue
var SPPlayerFourRectangleColor = Color.teal

struct SPGameScoreCard: View{
    
    @State var rectangleHeight = 35.0
    @State var rectangleWidth = 70.0
    @State var smallRectangleWidth = 35.0
    
    @State var pageNum = 1
    @State var leftButtonDisabled = true
    @State var rightButtonDisabled = false
    @State var leftButtonColor = Color.gray
    @State var rightButtonColor =  Color.yellow
    
    @State var saveButtonMessage = "Save my score"
    @State var saveButtonColor = Color.blue
    @State var saveButtonDisabled = false
    
    var body: some View{
        NavigationStack{
            VStack{
                
                
                
                if pageNum == 1{
                    
                    
                    VStack{
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("#").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text("Par").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(SP_PLAYER_ONE.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(SP_PLAYER_TWO.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(SP_PLAYER_THREE.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(SP_PLAYER_FOUR.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 1 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("1").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 0).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 0).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 0).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 0).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 0).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 2 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("2").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 1).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 1).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 1).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 1).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 1).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 3 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("3").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 2).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 2).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 2).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 2).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 2).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 4 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("4").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 3).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 3).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 3).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 3).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 3).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 5 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("5").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 4).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 4).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 4).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 4).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 4).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 6 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("6").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 5).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 5).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 5).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 5).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 5).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 7 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("7").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 6).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 6).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 6).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 6).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 6).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 8 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("8").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 7).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 7).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 7).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 7).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 7).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 9 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("9").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 8).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 8).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 8).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 8).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 8).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                    }
                    
                    
                    
                    
                    
                    
                } else if pageNum == 2{
                    VStack{
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("#").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text("Par").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(SP_PLAYER_ONE.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(SP_PLAYER_TWO.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(SP_PLAYER_THREE.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(SP_PLAYER_FOUR.getPlayerName()).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 10 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("10").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 9).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 9).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 9).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 9).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 9).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 11 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("11").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 10).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 10).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 10).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 10).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 10).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 12 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("12").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 11).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 11).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 11).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 11).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 11).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 13 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("13").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 12).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 12).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 12).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 12).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 12).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 14 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("14").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 13).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 13).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 13).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 13).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 13).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 15 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("15").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 14).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 14).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 14).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 14).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 14).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 16 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("16").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 15).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 15).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 15).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 15).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 15).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 17 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("17").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 16).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 16).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 16).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 16).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 16).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                        
                        // ======================== HOLE 18 ========================
                        
                        HStack{
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.yellow).cornerRadius(5)
                                Text("18").foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            ZStack{
                                Rectangle().frame(width: smallRectangleWidth, height: rectangleHeight).foregroundColor(.black).cornerRadius(5)
                                Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 17).getParNumber())).foregroundColor(.white).fontDesign(.rounded)
                            }
                            
                            HStack(spacing: 0){
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(SPPlayerOneRectangleColor)
                                    Text(String(SP_PLAYER_ONE.getGolfHole(holeIndex: 17).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerTwoRectangleColor)
                                    Text(String(SP_PLAYER_TWO.getGolfHole(holeIndex: 17).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).foregroundColor(SPPlayerThreeRectangleColor)
                                    Text(String(SP_PLAYER_THREE.getGolfHole(holeIndex: 17).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                                
                                ZStack{
                                    Rectangle().frame(width: rectangleWidth, height: rectangleHeight).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(SPPlayerFourRectangleColor)
                                    Text(String(SP_PLAYER_FOUR.getGolfHole(holeIndex: 17).getPlayerStrokes())).foregroundColor(Color.white)
                                        .fontDesign(.rounded)
                                }
                            }
                            
                        }
                    }
                    
                }
                
                
                
                
                HStack{
                    Button(action: {
                        changePageNum()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).cornerRadius(5).shadow(radius: 3).foregroundColor(leftButtonColor)
                            Text("<").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                            
                        }
                    }).disabled(leftButtonDisabled)
                    
                    Button(action: {
                        changePageNum()
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).cornerRadius(5).shadow(radius: 3).foregroundColor(rightButtonColor)
                            Text(">").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                            
                        }
                    }).disabled(rightButtonDisabled)
                }
                
                Button(action: {
                    saveButtonColor = Color.gray
                    saveButtonMessage = "Saved"
                    saveButtonDisabled = true
                    saveSPGameScores()
                }, label: {
                    ZStack{
                        Rectangle().frame(width: 240, height: 40).cornerRadius(5).shadow(radius: 3).foregroundColor(saveButtonColor)
                        Text(saveButtonMessage).fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        
                    }
                }).padding(.top, 10).disabled(saveButtonDisabled)
                
                NavigationLink(destination: PlayView().onAppear(perform: resetGame)){
                    
                    ZStack{
                        Rectangle().frame(width: 240, height: 40).cornerRadius(5).shadow(radius: 3).foregroundColor(.yellow)
                        Text("Done").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        
                    }
                }
                
                
                
            }
        }.navigationTitle("Scorecard")
    }
    
    func saveSPGameScores() -> Void{
        
        let gamePlayed = 1
        var gameWon = 0
        var par = 0
        var birdie = 0
        var eagle = 0
        var albatross = 0
        var bogey = 0
        var doubleBogey = 0
        var tripleBogey = 0
        var quadrupleBogey = 0
        
        if SPPlayer == 1{
                
            var holeStrokes = 0
            var holePar = 0
            
            for i in 0...(SPNumOfHoles - 1){
                    
                    holeStrokes = SP_PLAYER_ONE.getGolfHole(holeIndex: i).getPlayerStrokes()
                    holePar = SP_PLAYER_ONE.getGolfHole(holeIndex: i).getParNumber()
                    
                    if holeStrokes - holePar == 4{
                        quadrupleBogey += 1
                    } else if holeStrokes - holePar == 3{
                        tripleBogey += 1
                    } else if holeStrokes - holePar == 2{
                        doubleBogey += 1
                    } else if holeStrokes - holePar == 1{
                        bogey += 1
                    } else if holeStrokes - holePar == 0{
                        par += 1
                    } else if holeStrokes - holePar == -1{
                        birdie += 1
                    } else if holeStrokes - holePar == -2{
                        eagle += 1
                    } else if holeStrokes - holePar == -3{
                        albatross += 1
                    }
                }
            
            if determineWinner() == 1{
                gameWon += 1
            }
            
        } else if SPPlayer == 2{
            
            var holeStrokes = 0
            var holePar = 0
            
            for i in 0...(SPNumOfHoles - 1){
                
                holeStrokes = SP_PLAYER_TWO.getGolfHole(holeIndex: i).getPlayerStrokes()
                holePar = SP_PLAYER_TWO.getGolfHole(holeIndex: i).getParNumber()
                
                if holeStrokes - holePar == 4{
                    quadrupleBogey += 1
                } else if holeStrokes - holePar == 3{
                    tripleBogey += 1
                } else if holeStrokes - holePar == 2{
                    doubleBogey += 1
                } else if holeStrokes - holePar == 1{
                    bogey += 1
                } else if holeStrokes - holePar == 0{
                    par += 1
                } else if holeStrokes - holePar == -1{
                    birdie += 1
                } else if holeStrokes - holePar == -2{
                    eagle += 1
                } else if holeStrokes - holePar == -3{
                    albatross += 1
                }
            }
            
            if determineWinner() == 2{
                gameWon += 1
            }
            
        } else if SPPlayer == 3{
            
            var holeStrokes = 0
            var holePar = 0
            
            for i in 0...(SPNumOfHoles - 1){
                
                holeStrokes = SP_PLAYER_THREE.getGolfHole(holeIndex: i).getPlayerStrokes()
                holePar = SP_PLAYER_THREE.getGolfHole(holeIndex: i).getParNumber()
                
                if holeStrokes - holePar == 4{
                    quadrupleBogey += 1
                } else if holeStrokes - holePar == 3{
                    tripleBogey += 1
                } else if holeStrokes - holePar == 2{
                    doubleBogey += 1
                } else if holeStrokes - holePar == 1{
                    bogey += 1
                } else if holeStrokes - holePar == 0{
                    par += 1
                } else if holeStrokes - holePar == -1{
                    birdie += 1
                } else if holeStrokes - holePar == -2{
                    eagle += 1
                } else if holeStrokes - holePar == -3{
                    albatross += 1
                }
            }
            
            if determineWinner() == 3{
                gameWon += 1
            }
            
        } else if SPPlayer == 4{
            
            var holeStrokes = 0
            var holePar = 0
            
            for i in 0...(SPNumOfHoles - 1){
                
                holeStrokes = SP_PLAYER_TWO.getGolfHole(holeIndex: i).getPlayerStrokes()
                holePar = SP_PLAYER_TWO.getGolfHole(holeIndex: i).getParNumber()
                
                if holeStrokes - holePar == 4{
                    quadrupleBogey += 1
                } else if holeStrokes - holePar == 3{
                    tripleBogey += 1
                } else if holeStrokes - holePar == 2{
                    doubleBogey += 1
                } else if holeStrokes - holePar == 1{
                    bogey += 1
                } else if holeStrokes - holePar == 0{
                    par += 1
                } else if holeStrokes - holePar == -1{
                    birdie += 1
                } else if holeStrokes - holePar == -2{
                    eagle += 1
                } else if holeStrokes - holePar == -3{
                    albatross += 1
                }
            }
            
            if determineWinner() == 4{
                gameWon += 1
            }
        }
        
        StatsView().updateSPStatistics(gamesPlayed: gamePlayed, gamesWon: gameWon, par: par, birdie: birdie, eagle: eagle, albatross: albatross, bogey: bogey, doubleBogey: doubleBogey, tripleBogey: tripleBogey, quadrupleBogey: quadrupleBogey)
        
    }
    
    func determineWinner() -> Int{
        
        var winner = 0
        
        var playerOneStrokesTotal = 0
        var playerTwoStrokesTotal = 0
        var playerThreeStrokesTotal = 0
        var playerFourStrokesTotal = 0
        
        playerOneStrokesTotal = playerOneTotalStrokes()
        playerTwoStrokesTotal = playerTwoTotalStrokes()
        playerThreeStrokesTotal = playerThreeTotalStrokes()
        playerFourStrokesTotal = playerFourTotalStrokes()
        
        if (playerOneStrokesTotal < playerTwoStrokesTotal) && (playerOneStrokesTotal < playerThreeStrokesTotal) && (playerOneStrokesTotal < playerFourStrokesTotal){
            
            winner = 1
            
        } else if (playerTwoStrokesTotal < playerOneStrokesTotal) && (playerTwoStrokesTotal < playerThreeStrokesTotal) && (playerTwoStrokesTotal < playerFourStrokesTotal){
            
            winner = 2
            
        } else if (playerThreeStrokesTotal < playerOneStrokesTotal) && (playerThreeStrokesTotal < playerTwoStrokesTotal) && (playerThreeStrokesTotal < playerFourStrokesTotal){
            
            winner = 3
            
        } else if (playerFourStrokesTotal < playerOneStrokesTotal) && (playerFourStrokesTotal < playerTwoStrokesTotal) && (playerFourStrokesTotal < playerThreeStrokesTotal){
            
            winner = 4
            
        }
            
            return winner
    }
    
    func playerOneTotalStrokes() -> Int{
        var totalStrokes = 0
        for i in 0...(SPNumOfHoles - 1){
            totalStrokes += SP_PLAYER_ONE.getGolfHole(holeIndex: i).getPlayerStrokes()
        }
        return totalStrokes
    }
    
    func playerTwoTotalStrokes() -> Int{
        var totalStrokes = 0
        for i in 0...(SPNumOfHoles - 1){
            totalStrokes += SP_PLAYER_TWO.getGolfHole(holeIndex: i).getPlayerStrokes()
        }
        return totalStrokes
    }
    
    func playerThreeTotalStrokes() -> Int{
        var totalStrokes = 0
        for i in 0...(SPNumOfHoles - 1){
            totalStrokes += SP_PLAYER_THREE.getGolfHole(holeIndex: i).getPlayerStrokes()
        }
        return totalStrokes
    }
    
    func playerFourTotalStrokes() -> Int{
        var totalStrokes = 0
        for i in 0...(SPNumOfHoles - 1){
            totalStrokes += SP_PLAYER_FOUR.getGolfHole(holeIndex: i).getPlayerStrokes()
        }
        return totalStrokes
    }
    
    
    
    func changePageNum() -> Void{
        if pageNum == 1{
            pageNum = 2
            leftButtonDisabled = false
            rightButtonDisabled = true
            leftButtonColor = Color.yellow
            rightButtonColor = Color.gray
        } else if pageNum == 2{
            pageNum = 1
            leftButtonDisabled = true
            rightButtonDisabled = false
            leftButtonColor = Color.gray
            rightButtonColor = Color.yellow
        }
    }
    
    func resetGame() -> Void{
        SPHoleNum = 1
        SPGameDone = false
        SPHoleGamePlay().resetHole()
        
    }
}

struct SPGameScoreCard_Previews: PreviewProvider {
    static var previews: some View {
        SPGameScoreCard()
    }
}
