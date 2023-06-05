// Statistics view file

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
// STRUCT: displays view for statistics tab
struct StatsView: View {
    
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
       NavigationStack{
            
            // vstack for view
            VStack{
                // hstack for stat type buttons
                HStack{
                        Menu{
                            NavigationLink(destination: StatInfoView()){
                                Label("Statistics info", systemImage: "info.circle")
                            }
                            
                            NavigationLink(destination: StatResetView()){
                                Label("Reset stroke play", systemImage: "arrow.counterclockwise")
                            }
                            
                            NavigationLink(destination: StatResetView()){
                                Label("Reset skins", systemImage: "arrow.counterclockwise")
                            }
                            
                            NavigationLink(destination: StatResetView()){
                                Label("Reset match play", systemImage: "arrow.counterclockwise")
                            }
                            NavigationLink(destination: StatResetView()){
                                Label("Reset all", systemImage: "arrow.counterclockwise")
                            }
                            
                        } label:{
                            Image(systemName: "ellipsis.circle").resizable().frame(width: 35, height: 35)
                        }.padding(.leading)
                    Spacer()
                    
                }
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
                            .background(skinsButtonColor)
                            .disabled(isSkins)
                        
                    })
                    
                    Button(action: {
                        statType = "Match play"
                        isStrokePlay = false
                        isSkins = false
                        isMatchPlay = true
                        strokePlayButtonColor = Color.green
                        skinsButtonColor = Color.green
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
                    
                }.padding([.leading, .top, .trailing])
                
                
                Text(statType).font(.system(size: 40)).padding(.bottom, 30)
                
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
                
                Spacer()
            }
        }
    }
}


// MARK: -
// STRUCT: displays simulator for preview
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
