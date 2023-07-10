//
//  SPGameScoreCard.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-10.
//

import SwiftUI

struct SPGameScoreCard: View{
    var body: some View{
        NavigationStack{
            VStack{
                HStack{
                    ZStack{
                        Rectangle().frame(width: 35, height: 40).foregroundColor(.green).cornerRadius(5)
                    }
                    
                    HStack(spacing: 0){
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(.green)
                            Text(PLAYER_ONE.getPlayerName()).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                        
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).foregroundColor(.gray)
                            Text(PLAYER_TWO.getPlayerName()).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                        
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).foregroundColor(.gray)
                            Text(PLAYER_THREE.getPlayerName()).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                        
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(.gray)
                            Text(PLAYER_FOUR.getPlayerName()).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                    }
                    
                }
                
                // =====
                
                HStack{
                    ZStack{
                        Rectangle().frame(width: 35, height: 40).foregroundColor(.green).cornerRadius(5)
                        Text("1").foregroundColor(.white).fontDesign(.rounded)
                    }
                    
                    HStack(spacing: 0){
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topLeft, .bottomLeft]).foregroundColor(.green)
                            Text(String(PLAYER_ONE.getGolfHole(holeIndex: 0).getPlayerStrokes())).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                        
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).foregroundColor(.gray)
                            Text(PLAYER_TWO.getPlayerName()).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                        
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).foregroundColor(.gray)
                            Text(PLAYER_THREE.getPlayerName()).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                        
                        ZStack{
                            Rectangle().frame(width: 80, height: 40).cornerRadius(5, corners: [.topRight, .bottomRight]).foregroundColor(.gray)
                            Text(PLAYER_FOUR.getPlayerName()).foregroundColor(Color.white)
                                .fontDesign(.rounded)
                        }
                    }
                    
                }
                
                
                
                
                
                
                
                
                
                
                
            }
        }.navigationTitle("Scorecard").navigationBarBackButtonHidden(true)
    }
}

struct SPGameScoreCard_Previews: PreviewProvider {
    static var previews: some View {
        SPGameScoreCard()
    }
}
