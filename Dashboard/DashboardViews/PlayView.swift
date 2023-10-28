//
//  PlayView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-02.
//

import SwiftUI

struct PlayView: View {
    
    @State var GAME_BOX_WIDTH = 320.0
    @State var GAME_BOX_HEIGHT = 150.0
    @State var GAME_BOX_CONTENT_WIDTH = 290.0
    @State var GAME_BOX_CONTENT_HEIGHT = 120.0
    
    @State var gameMode = "none"
    var body: some View {
        
        NavigationStack{
            VStack{
                
                NavigationLink(destination: SPPlayerCount()){
                    ZStack{
                        Rectangle().foregroundColor(Color.white).frame(width: GAME_BOX_WIDTH, height: GAME_BOX_HEIGHT).cornerRadius(5).shadow(radius: 5)
                        VStack{
                            HStack{
                                Text("Stroke Play").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding(.bottom, 5)
                                
                                NavigationLink(destination: SPInstructions()){
                                    Image(systemName: "info.circle.fill").font(.system(size: 20)).foregroundColor(.gray)
                                }
                                
                                Spacer()
                            }
                            
                            HStack{
                                Text("Play for the lowest amount of strokes").foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            Rectangle().foregroundColor(.yellow).frame(width: 290, height: 10).cornerRadius(5)
                            
                            
                        }.frame(width: GAME_BOX_CONTENT_WIDTH, height: GAME_BOX_CONTENT_HEIGHT)
                    }
                }.padding()
                
                NavigationLink(destination: SkinsPlayerCount()){
                    ZStack{
                        Rectangle().foregroundColor(Color.white).frame(width: GAME_BOX_WIDTH, height: GAME_BOX_HEIGHT).cornerRadius(5).shadow(radius: 5)
                        VStack{
                            HStack{
                                Text("Skins").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding(.bottom, 5)
                                
                                NavigationLink(destination: SPInstructions()){
                                    Image(systemName: "info.circle.fill").font(.system(size: 20)).foregroundColor(.gray)
                                }
                                
                                Spacer()
                            }
                            
                            HStack{
                                Text("Lowest hole score wins the skin").foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            Rectangle().foregroundColor(.green).frame(width: 290, height: 10).cornerRadius(5)
                            
                            
                        }.frame(width: GAME_BOX_CONTENT_WIDTH, height: GAME_BOX_CONTENT_HEIGHT)
                    }
                }.padding()
                
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
        
        
        
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
