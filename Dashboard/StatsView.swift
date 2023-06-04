//
//  StatsView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-02.
//

import SwiftUI

// MARK: -
// STRUCT: uploaded code to allow certain corners of buttons to be rounded
struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {
        
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

// MARK: -
struct StatsView: View {
    
    @State var statType = "Stroke play"
    @State var isStrokePlay = true
    @State var isSkins = false
    @State var isMatchPlay = false
    @State var strokePlayButtonColor = Color.gray
    @State var skinsButtonColor = Color.red
    @State var matchPlayButtonColor = Color.red
    @State var strokePlayButtonHeight = 38.0
    @State var skinsButtonHeight = 40.0
    @State var matchPlayButtonHeight = 40.0
    
    var body: some View {
        NavigationView{
            
            // vstack for view
            VStack{
                // hstack for stat type buttons
                
                
                HStack(spacing: 0){
                    Button(action: {
                        statType = "Stroke play"
                        isStrokePlay = true
                        isSkins = false
                        isMatchPlay = false
                        strokePlayButtonColor = Color.gray
                        skinsButtonColor = Color.red
                        matchPlayButtonColor = Color.red
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
                        strokePlayButtonColor = Color.red
                        skinsButtonColor = Color.gray
                        matchPlayButtonColor = Color.red
                        strokePlayButtonHeight = 40.0
                        skinsButtonHeight = 38.0
                        matchPlayButtonHeight = 40.0
                    }, label: {
                        Text("Skins")
                            .shadow(radius: 100)
                            .foregroundColor(Color.white)
                            .fontDesign(.rounded)
                            .frame(width: 120, height: skinsButtonHeight)
                            .background(skinsButtonColor)
                            .disabled(isSkins)
                        
                    })
                    
                    Button(action: {
                        statType = "Match play"
                        isStrokePlay = false
                        isSkins = false
                        isMatchPlay = true
                        strokePlayButtonColor = Color.red
                        skinsButtonColor = Color.red
                        matchPlayButtonColor = Color.gray
                        strokePlayButtonHeight = 40.0
                        skinsButtonHeight = 40.0
                        matchPlayButtonHeight = 38.0
                    }, label: {
                        Text("Match play")
                            .foregroundColor(Color.white)
                            .fontDesign(.rounded)
                            .frame(width: 120, height: matchPlayButtonHeight)
                            .background(matchPlayButtonColor)
                            .cornerRadius(5, corners: [.topRight, .bottomRight])
                            .disabled(isMatchPlay)
                        
                    })
                    
                }.padding()
                
                
                Text(statType).font(.system(size: 40)).padding(.bottom, 50)
                
                if statType == "Stroke play"{
                    HStack{
                        VStack{
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Games played")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Par")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Eagle")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Bogey")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Triple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                        
                        
                        
                        
                        VStack{
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Games won")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Birdie")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Albatross")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Double Bogey")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Quadruple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                    }.scaledToFit()
                    
                    
                } else if statType == "Skins"{
                    HStack{
                        VStack{
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Games played")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Par")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Eagle")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Bogey")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Triple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                        
                        
                        
                        
                        VStack{
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Games won")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Birdie")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Albatross")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Double Bogey")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Quadruple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                    }.scaledToFit()
                        
                
                    
                } else if statType == "Match play"{
                    HStack{
                        VStack{
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Games played")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Par")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Eagle")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Bogey")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Triple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                        
                        
                        
                        
                        VStack{
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Games won")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Birdie")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Albatross")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Double Bogey")
                            }
                            Spacer()
                            VStack{
                                Text("200").font(.system(size: 30))
                                Text("Quadruple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                    }.scaledToFit()
                    
                }
            }
        }
    }
}


// MARK: -
// application preview display
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
