//
//  AchievementView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-04.
//

import SwiftUI
 
struct AchievementsView: View {
    
    @AppStorage("ACHIEVE_1_STAT") var SP_A1_STAT = 0
    @AppStorage("ACHIEVE_2_STAT") var SP_A2_STAT = 0
    @AppStorage("ACHIEVE_3_STAT") var SP_A3_STAT = 0
    @AppStorage("ACHIEVE_4_STAT") var SP_A4_STAT = 0
    
    @State var SP_ACHIEVE_ONE = ForeAchievement(description: "Play 100 games of Stroke Play")
    @State var SP_ACHIEVE_TWO = ForeAchievement(description: "Earn 50 bogeys in Stroke Play")
    @State var SP_ACHIEVE_THREE = ForeAchievement(description: "Earn 25 pars in Stroke Play")
    @State var SP_ACHIEVE_FOUR = ForeAchievement(description: "Earn 10 birdies in Stroke Play")

    
    @State var achievementProgress = 0.0
    @State var statType = "Stroke play"
    @State var isStrokePlay = true
    @State var isSkins = false
    @State var isMatchPlay = false
    @State var strokePlayButtonColor = Color.gray
    @State var skinsButtonColor = Color.green
    @State var matchPlayButtonColor = Color.green
    @State var strokePlayButtonHeight = 38.0
    @State var skinsButtonHeight = 40.0
    @State var matchPlayButtonHeight = 40.0
    
    var body: some View {
        VStack{
            HStack(spacing: 0){
                Button(action: {
                    statType = "Stroke play"
                    isStrokePlay = true
                    isSkins = false
                    isMatchPlay = false
                    strokePlayButtonColor = Color.gray
                    skinsButtonColor = Color.green
                    matchPlayButtonColor = Color.green
                    strokePlayButtonHeight = 38.0
                    skinsButtonHeight = 40.0
                    matchPlayButtonHeight = 40.0
                }, label: {
                    Text("Stroke play")
                        .foregroundColor(Color.white)
                        .fontDesign(.rounded)
                        .frame(width: 120, height: strokePlayButtonHeight)
                        .background(strokePlayButtonColor)
                        .cornerRadius(5, corners: [.topLeft, .bottomLeft])
                        .disabled(isStrokePlay)
                    
                })
                
                
                
                Button(action: {
                    statType = "Skins"
                    isStrokePlay = false
                    isSkins = true
                    isMatchPlay = false
                    strokePlayButtonColor = Color.green
                    skinsButtonColor = Color.gray
                    matchPlayButtonColor = Color.green
                    strokePlayButtonHeight = 40.0
                    skinsButtonHeight = 38.0
                    matchPlayButtonHeight = 40.0
                }, label: {
                    Text("Skins")
                        .shadow(radius: 100)
                        .foregroundColor(Color.white)
                        .fontDesign(.rounded)
                        .frame(width: 120, height: skinsButtonHeight)
                        .background(skinsButtonColor).cornerRadius(5, corners: [.topRight, .bottomRight])
                        .disabled(isSkins)
                    
                })
                
            }.padding([.leading, .top, .trailing])
            
            Text(statType).font(.system(size: 40)).fontDesign(.rounded).bold().padding(.bottom, 30)
            
            VStack{
                
                ZStack{
                    Rectangle().foregroundColor(Color.white).frame(width: 350, height: 80).cornerRadius(5).shadow(radius: 5)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(SP_ACHIEVE_ONE.getDescription()).bold()
                            
                            if ((Double(SP_A1_STAT) / 100.0) * 100.0) < 100{
                                Text(String(((Double(SP_A1_STAT) / 100.0) * 100.0)) + "%").fontDesign(.rounded).padding(.leading, 10)
                            } else {
                                Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).padding(.leading, 10).opacity(0.8)
                            }
                            
                        }.padding(.bottom, 10).fontDesign(.rounded)
                        
                        ZStack(alignment: .leading){
                            Rectangle().foregroundColor(.yellow).frame(width: 320, height: 10).cornerRadius(3).opacity(0.2)
                            
                            if ((Double(SP_A1_STAT) / 100.0) * 100.0) < 100{
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(((Double(SP_A1_STAT) / 100.0) * 100.0)), height: 10).cornerRadius(3)
                            } else {
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(100), height: 10).cornerRadius(3)
                            }
                            
                        }
                    }
                        
                    
                }.padding()
                
                
                
                ZStack{
                    Rectangle().foregroundColor(Color.white).frame(width: 350, height: 80).cornerRadius(5).shadow(radius: 5)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(SP_ACHIEVE_TWO.getDescription()).bold()
                            
                            if ((Double(SP_A2_STAT) / 50.0) * 100.0) < 100{
                                Text(String(((Double(SP_A2_STAT) / 50.0) * 100.0)) + "%").fontDesign(.rounded).padding(.leading, 10)
                            } else {
                                Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).padding(.leading, 10).opacity(0.8)
                            }
                            
                        }.padding(.bottom, 10).fontDesign(.rounded)
                        
                        ZStack(alignment: .leading){
                            Rectangle().foregroundColor(.yellow).frame(width: 320, height: 10).cornerRadius(3).opacity(0.2)
                            
                            if ((Double(SP_A2_STAT) / 50.0) * 100.0) < 100{
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(((Double(SP_A2_STAT) / 50.0) * 100.0)), height: 10).cornerRadius(3)
                            } else {
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(100), height: 10).cornerRadius(3)
                            }
                        }
                    }
                        
                    
                }.padding()
                
                
                
                ZStack{
                    Rectangle().foregroundColor(Color.white).frame(width: 350, height: 80).cornerRadius(5).shadow(radius: 5)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(SP_ACHIEVE_THREE.getDescription()).bold()
                            
                            if ((Double(SP_A3_STAT) / 25.0) * 100.0) < 100{
                                Text(String(((Double(SP_A3_STAT) / 25.0) * 100.0)) + "%").fontDesign(.rounded).padding(.leading, 10)
                            } else {
                                Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).padding(.leading, 10).opacity(0.8)
                            }
                            
                        }.padding(.bottom, 10).fontDesign(.rounded)
                        
                        ZStack(alignment: .leading){
                            Rectangle().foregroundColor(.yellow).frame(width: 320, height: 10).cornerRadius(3).opacity(0.2)
                            
                            if ((Double(SP_A3_STAT) / 25.0) * 100.0) < 100{
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(((Double(SP_A3_STAT) / 25.0) * 100.0)), height: 10).cornerRadius(3)
                            } else {
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(100), height: 10).cornerRadius(3)
                            }
                        }
                    }
                        
                    
                }.padding()
                
                
                
                
                ZStack{
                    Rectangle().foregroundColor(Color.white).frame(width: 350, height: 80).cornerRadius(5).shadow(radius: 5)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(SP_ACHIEVE_FOUR.getDescription()).bold()
                            
                            if ((Double(SP_A4_STAT) / 10.0) * 100.0) < 100{
                                Text(String(((Double(SP_A4_STAT) / 10.0) * 100.0)) + "%").fontDesign(.rounded).padding(.leading, 10)
                            } else {
                                Image(systemName: "checkmark.circle.fill").resizable().frame(width: 20, height: 20).padding(.leading, 10).opacity(0.8)
                            }
                            
                        }.padding(.bottom, 10).fontDesign(.rounded)
                        
                        ZStack(alignment: .leading){
                            Rectangle().foregroundColor(.yellow).frame(width: 320, height: 10).cornerRadius(3).opacity(0.2)
                            
                            if ((Double(SP_A4_STAT) / 10.0) * 100.0) < 100{
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(((Double(SP_A4_STAT) / 10.0) * 100.0)), height: 10).cornerRadius(3)
                            } else {
                                Rectangle().foregroundColor(.yellow).frame(width: 3.2 * CGFloat(100), height: 10).cornerRadius(3)
                            }
                        }
                    }
                        
                    
                }.padding()
                
                
            }
            
            Spacer()
            
        }
    }
    
    func updateSPAchieveStatistics(A1_STAT: Int, A2_STAT: Int, A3_STAT: Int, A4_STAT: Int) -> Void{
        
        SP_A1_STAT += A1_STAT // games played
        SP_A2_STAT += A2_STAT // bogeys
        SP_A3_STAT += A3_STAT // pars
        SP_A4_STAT += A4_STAT // birdies
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}
