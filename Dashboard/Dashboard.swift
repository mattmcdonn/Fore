// DASHBOARD CLASS

import SwiftUI


// MARK: -
/* STRUCT: displays the application dashboard
 to allow easy navigation between other views
*/
struct Dashboard: View {
    var body: some View{
        // displays tabs at the bottom of UI
        TabView{
            
            
            StatsView().tabItem(){
                Image(systemName: "chart.bar")
                Text("Statistics").fontDesign(.rounded)
                
            }
            
            PlayView().tabItem(){
                Image(systemName: "play.fill")
                Text("New Game").fontDesign(.rounded)
                
            }
            
            AchievementsView().tabItem(){
                Image(systemName: "trophy")
                Text("Achievements").fontDesign(.rounded)
                
            }
            
        }.padding([.leading, .trailing])
    }
}

// MARK: -
// application preview display
struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
