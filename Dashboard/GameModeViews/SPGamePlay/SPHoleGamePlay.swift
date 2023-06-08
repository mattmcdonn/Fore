//
//  SPHoleGamePlay.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

struct SPHoleGamePlay: View {
    
    @State var holeNum = 0
    @State var currPlayer = 1
    @State var numOfStrokes = 0
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button(action:{
                        
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

class SPGolfHole {
    var holeNumber: Int
    var playerStrokes: Int
    var parNumber: Int
    
    init(holeNumber: Int, parNumber: Int, playerStrokes: Int){
        self.holeNumber = holeNumber
        self.parNumber = parNumber
        self.playerStrokes = playerStrokes
    }
    
    func getHoleNumber() -> Int{
        return self.holeNumber
    }
    
    func setHoleNumber(holeNum: Int){
        self.holeNumber = holeNum
    }
    
    func getParNumber() -> Int{
        return self.parNumber
    }
    
    func setParNumber(parNum: Int){
        self.parNumber = parNum
    }
    
    func getPlayerOneStrokes() -> Int{
        return self.playerStrokes
    }
    
}
