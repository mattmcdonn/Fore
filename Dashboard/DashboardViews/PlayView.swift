//
//  PlayView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-02.
//

import SwiftUI

struct PlayView: View {
    
    @State var gameMode = "none"
    var body: some View {
        
        NavigationStack{
            VStack{
                
                NavigationLink(destination: StrokePlayGameView()){
                    ZStack{
                        Rectangle().foregroundColor(Color.white).frame(width: 320, height: 200).cornerRadius(5).shadow(radius: 5)
                        VStack{
                            HStack{
                                Text("Stroke Play").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                                
                                NavigationLink(destination: SPInstructions()){
                                    Image(systemName: "info.circle.fill").font(.system(size: 20)).foregroundColor(.gray)
                                }
                            }.padding(.trailing, 100).padding(.bottom, 90)
                            
                            Text("Play for the lowest amount \nof strokes to win").multilineTextAlignment(.leading).padding(.trailing, 80).padding(.bottom, 20)
                        }
                    }
                }.padding()
                
                NavigationLink(destination: StrokePlayGameView()){
                    ZStack{
                        Rectangle().foregroundColor(Color.white).frame(width: 320, height: 200).cornerRadius(5).shadow(radius: 5)
                        
                    }
                }.padding()
                
                NavigationLink(destination: StrokePlayGameView()){
                    ZStack{
                        Rectangle().foregroundColor(Color.white).frame(width: 320, height: 200).cornerRadius(5).shadow(radius: 5)
                        
                    }
                }.padding()
                
                Spacer()
            }
        }
        
        
        
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
