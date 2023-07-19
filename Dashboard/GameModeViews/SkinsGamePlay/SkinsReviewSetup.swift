//
//  SkinsReviewGame.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-07-14.
//


import SwiftUI

struct SkinsReviewSetup: View{
    
    @State var numOfPlayers = SkinsPlayerCount().getNumOfPlayers()
    @State var numOfHoles = SkinsHoleCount().getNumOfHoles()
    
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
                            Text(String(numOfPlayers) + " players").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }
                        HStack{
                            Text(String(numOfHoles) + " holes").fontDesign(.rounded).font(.system(size: 25)).bold().foregroundColor(.black)
                            Spacer()
                        }
                        Spacer()
                        
                        Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                        
                    }.frame(width: 290, height: 170)
                }.padding()
                
                
                NavigationLink(destination: SkinsParForHole()){
                        ZStack{
                            Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(.green)
                            Text("Start").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        }
                }.padding()
            }
        }
    }
    
}


struct SkinsReviewGame_Previews: PreviewProvider {
    static var previews: some View {
        SkinsReviewSetup()
    }
}
