//
//  SPHoleGamePlay.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

struct SPHoleGamePlay: View {
    
    @State var holeNum = 0
    @State var numOfStrokes = 0
    @State var numOfPlayers = SPPlayerCount().getNumOfPlayers()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Text(player1.getPlayerName())
                HStack{
                    Button(action:{
                        if numOfStrokes >= 1{
                            numOfStrokes -= 1
                        }
                        
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 50, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("-").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                            
                        }
                    })
                    
                    ZStack{
                        Rectangle().frame(width: 200, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                        Text("Number of strokes: " + String(numOfStrokes) ).fontDesign(.rounded).font(.system(size: 18)).bold().foregroundColor(.black)
                        
                        
                    }.frame(width: 200, height: 50)
                    
                    Button(action:{
                        numOfStrokes += 1
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 50, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.white)
                            Text("+").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                            
                        }
                    })
                    
                }
                
            }
        }.navigationTitle("Hole number here").navigationBarBackButtonHidden(true)
    }
}

struct SPHoleGamePlay_Previews: PreviewProvider {
    static var previews: some View {
        SPHoleGamePlay()
    }
}


