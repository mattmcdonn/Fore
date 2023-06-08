//
//  SPHoleCount.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-07.
//

import SwiftUI

struct SPHoleCount: View {
    
    @State var numOfHoles = 0
    @State var noHoleSelected = true
    @State var buttonNineColor = Color.white
    @State var buttonEighteenColor = Color.white
    @State var startButtonColor = Color.white
    
    var body: some View {
        VStack{
            
            Text("Number of holes").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black).padding()
            
            HStack{
            
                    Button(action: {
                        noHoleSelected = false
                        numOfHoles = 9
                        buttonNineColor = Color.green
                        buttonEighteenColor = Color.white
                        startButtonColor = Color.green
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonNineColor)
                            Text("9").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    Button(action: {
                        noHoleSelected = false
                        numOfHoles = 18
                        buttonNineColor = Color.white
                        buttonEighteenColor = Color.green
                        startButtonColor = Color.green
                    }, label: {
                        ZStack{
                            Rectangle().frame(width: 100, height: 100).cornerRadius(5).shadow(radius: 3).foregroundColor(buttonEighteenColor)
                            Text("18").fontDesign(.rounded).font(.system(size: 30)).bold().foregroundColor(.black)
                            
                        }
                    }).padding()
                    
                    
                
                
            }
                NavigationLink(destination: SPHoleGamePlay()){
                    
                    ZStack{
                        Rectangle().frame(width: 240, height: 50).cornerRadius(5).shadow(radius: 3).foregroundColor(startButtonColor)
                        Text("Start").fontDesign(.rounded).font(.system(size: 20)).bold().foregroundColor(.black)
                        
                    }
                }.padding(.top, 200).disabled(noHoleSelected)
                
                
            }.frame(width: 350, height: 750)
            
        }
    }
    
struct SPHoleCount_Previews: PreviewProvider {
    static var previews: some View {
        SPHoleCount()
    }
}
