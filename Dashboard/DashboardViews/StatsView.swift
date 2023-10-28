// Statistics view file

import SwiftUI

// MARK: -
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
    @State var skinsButtonColor = Color.green
    @State var matchPlayButtonColor = Color.green
    @State var strokePlayButtonHeight = 38.0
    @State var skinsButtonHeight = 40.0
    @State var matchPlayButtonHeight = 40.0
    
    @AppStorage("SP_GAMES_PLAYED") var SPGamesPlayed = 0
    @AppStorage("SP_GAMES_WON") var SPGamesWon = 0
    @AppStorage("SP_PAR") var SPPar = 0
    @AppStorage("SP_BIRDIE") var SPBirdie = 0
    @AppStorage("SP_EAGLE") var SPEagle = 0
    @AppStorage("SP_ALBATROSS") var SPAlbatross = 0
    @AppStorage("SP_BOGEY") var SPBogey = 0
    @AppStorage("SP_DOUBLE_BOGEY") var SPDoubleBogey = 0
    @AppStorage("SP_TRIPLE_BOGEY") var SPTripleBogey = 0
    @AppStorage("SP_QUADRUPLE_BOGEY") var SPQuadrupleBogey = 0
    
    @AppStorage("SKINS_GAMES_PLAYED") var SkinsGamesPlayed = 0
    @AppStorage("SKINS_SKINS_WON") var SkinsWon = 0
    @AppStorage("SKINS_PAR") var SkinsPar = 0
    @AppStorage("SKINS_BIRDIE") var SkinsBirdie = 0
    @AppStorage("SKINS_EAGLE") var SkinsEagle = 0
    @AppStorage("SKINS_ALBATROSS") var SkinsAlbatross = 0
    @AppStorage("SKINS_BOGEY") var SkinsBogey = 0
    @AppStorage("SKINS_DOUBLE_BOGEY") var SkinsDoubleBogey = 0
    @AppStorage("SKINS_TRIPLE_BOGEY") var SkinsTripleBogey = 0
    @AppStorage("SKINS_QUADRUPLE_BOGEY") var SkinsQuadrupleBogey = 0
    
    var body: some View {
       NavigationStack{
            VStack{
                HStack{
                        Menu{
                            NavigationLink(destination: StatInfoView()){
                                Label("Statistics info", systemImage: "info.circle")
                            }
                            
                            NavigationLink(destination: StrokePlayStatReset()){
                                Label("Reset stroke play", systemImage: "arrow.counterclockwise")
                            }
                            
                            NavigationLink(destination: SkinStatReset()){
                                Label("Reset skins", systemImage: "arrow.counterclockwise")
                            }
                            
                            NavigationLink(destination: AllStatReset()){
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
                            .background(skinsButtonColor).cornerRadius(5, corners: [.topRight, .bottomRight])
                            .disabled(isSkins)
                        
                    })
                    
                    
                }.padding([.leading, .top, .trailing])
                
                
                Text(statType).font(.system(size: 40)).fontDesign(.rounded).bold().padding(.bottom, 30)
                
                if statType == "Stroke play"{
                    HStack{
                        VStack{
                            VStack{
                                Text(String(SPGamesPlayed)).font(.system(size: 30))
                                Text("Games played")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPPar)).font(.system(size: 30))
                                Text("Par")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPEagle)).font(.system(size: 30))
                                Text("Eagle")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPBogey)).font(.system(size: 30))
                                Text("Bogey")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPTripleBogey)).font(.system(size: 30))
                                Text("Triple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                        
                        
                        
                        
                        VStack{
                            VStack{
                                Text(String(SPGamesWon)).font(.system(size: 30))
                                Text("Games won")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPBirdie)).font(.system(size: 30))
                                Text("Birdie")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPAlbatross)).font(.system(size: 30))
                                Text("Albatross")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPDoubleBogey)).font(.system(size: 30))
                                Text("Double Bogey")
                            }
                            Spacer()
                            VStack{
                                Text(String(SPQuadrupleBogey)).font(.system(size: 30))
                                Text("Quadruple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                    }.scaledToFit()
                    
                    
                } else if statType == "Skins"{
                    HStack{
                        VStack{
                            VStack{
                                Text(String(SkinsGamesPlayed)).font(.system(size: 30))
                                Text("Games played")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsPar)).font(.system(size: 30))
                                Text("Par")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsEagle)).font(.system(size: 30))
                                Text("Eagle")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsBogey)).font(.system(size: 30))
                                Text("Bogey")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsTripleBogey)).font(.system(size: 30))
                                Text("Triple Bogey")
                            }
                            Spacer()
                        }.padding().scaledToFit()
                        
                        
                        
                        
                        VStack{
                            VStack{
                                Text(String(SkinsWon)).font(.system(size: 30))
                                Text("Skins won")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsBirdie)).font(.system(size: 30))
                                Text("Birdie")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsAlbatross)).font(.system(size: 30))
                                Text("Albatross")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsDoubleBogey)).font(.system(size: 30))
                                Text("Double Bogey")
                            }
                            Spacer()
                            VStack{
                                Text(String(SkinsQuadrupleBogey)).font(.system(size: 30))
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
    
    func updateSPStatistics(gamesPlayed: Int, gamesWon: Int, par: Int, birdie: Int, eagle: Int, albatross: Int, bogey: Int, doubleBogey: Int, tripleBogey: Int, quadrupleBogey: Int) -> Void{
        
        SPGamesPlayed += gamesPlayed
        SPGamesWon += gamesWon
        SPPar += par
        SPBirdie += birdie
        SPEagle += eagle
        SPAlbatross += albatross
        SPBogey += bogey
        SPDoubleBogey += doubleBogey
        SPTripleBogey += tripleBogey
        SPQuadrupleBogey += quadrupleBogey
    }
    
    func updateSkinsStatistics(gamesPlayed: Int, skinsWon: Int, par: Int, birdie: Int, eagle: Int, albatross: Int, bogey: Int, doubleBogey: Int, tripleBogey: Int, quadrupleBogey: Int) -> Void{
        
        SkinsGamesPlayed += gamesPlayed
        SkinsWon += skinsWon
        SkinsPar += par
        SkinsBirdie += birdie
        SkinsEagle += eagle
        SkinsAlbatross += albatross
        SkinsBogey += bogey
        SkinsDoubleBogey += doubleBogey
        SkinsTripleBogey += tripleBogey
        SkinsQuadrupleBogey += quadrupleBogey
    }
    
    func resetSPStatistics() -> Void{
        SPGamesPlayed = 0
        SPGamesWon = 0
        SPPar = 0
        SPBirdie = 0
        SPEagle = 0
        SPAlbatross = 0
        SPBogey = 0
        SPDoubleBogey = 0
        SPTripleBogey = 0
        SPQuadrupleBogey = 0
        AchievementsView().SP_A1_STAT = 0
        AchievementsView().SP_A2_STAT = 0
        AchievementsView().SP_A3_STAT = 0
        AchievementsView().SP_A4_STAT = 0
    }
    
    func resetSkinsStat() -> Void{
        SkinsGamesPlayed = 0
        SkinsWon = 0
        SkinsPar = 0
        SkinsBirdie = 0
        SkinsEagle = 0
        SkinsAlbatross = 0
        SkinsBogey = 0
        SkinsDoubleBogey = 0
        SkinsTripleBogey = 0
        SkinsQuadrupleBogey = 0
    }
}


// MARK: -
struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
