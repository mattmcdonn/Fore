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
                            Rectangle().foregroundColor(.black).frame(width: 290, height: 10).cornerRadius(5)
                            
                            
                        }.frame(width: 290, height: 170)
                    }
                }.padding()
                
                NavigationLink(destination: StrokePlayGameView()){
                    ZStack{
                        Rectangle().foregroundColor(Color.white).frame(width: 320, height: 200).cornerRadius(5).shadow(radius: 5)
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
                            
                            
                        }.frame(width: 290, height: 170)
                    }
                }.padding()
                
                NavigationLink(destination: StrokePlayGameView()){
                    ZStack{
                        Rectangle().foregroundColor(Color.white).frame(width: 320, height: 200).cornerRadius(5).shadow(radius: 5)
                        VStack{
                            HStack{
                                Text("Match Play").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding(.bottom, 5)
                                
                                NavigationLink(destination: SPInstructions()){
                                    Image(systemName: "info.circle.fill").font(.system(size: 20)).foregroundColor(.gray)
                                }
                                
                                Spacer()
                            }
                            
                            HStack{
                                Text("Play to win the most holes").foregroundColor(.black)
                                
                                Spacer()
                            }
                            Spacer()
                            Rectangle().foregroundColor(.blue).frame(width: 290, height: 10).cornerRadius(5)
                            
                            
                        }.frame(width: 290, height: 170)
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
