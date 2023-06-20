//
//  SPHoleGamePlay.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

struct ReviewBeforePlay: View{
    var body: some View{
        NavigationStack{
            VStack{
                Text("Review game settings").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black).padding()
                
                ZStack{
                    
                    Rectangle().foregroundColor(Color.white).frame(width: 320, height: 200).cornerRadius(5).shadow(radius: 5)
                    VStack{
                        HStack{
                            Text("Stroke play").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }.padding(.bottom)
                        HStack{
                            Text(String(SPPlayerCount().getNumOfPlayers()) + " players").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }
                        HStack{
                            Text(String(SPHoleCount().getNumOfHoles()) + " holes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }
                        Spacer()
                        
                        Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                        
                    }.frame(width: 290, height: 170)
                }.padding()
                
                
                NavigationLink(destination: SPHoleGamePlay().onAppear(perform: setUpGame)){
                    
                   
                        
                        ZStack{
                            Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.green)
                            Text("Start").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        }
                    
                }//
            }
        }
    }
    
    func setUpGame() -> Void{
        print("This printed")
        
    }
}

struct SPHoleGamePlay: View {
    
    @State var holeNum = 0
    @State var numOfStrokes = 0
    
    var body: some View {
        NavigationStack{
            VStack{
                
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
        ReviewBeforePlay()
    }
}


