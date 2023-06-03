//
//  StatsView.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-02.
//

import SwiftUI

//
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
//



struct StatsView: View {
    
    @State var isStandard = true
    @State var isSkins = false
    @State var standardButtonColor = Color.red
    @State var skinsButtonColor = Color.gray
    @State var standardButtonHeight = 35.0
    @State var skinsButtonHeight = 40.0
    
    var body: some View {
        NavigationView{
            
            // hstack for stat type buttons
            HStack(spacing: 0){
                Button(action: {
                    isStandard = true
                    isSkins = false
                    standardButtonColor = Color.gray
                    skinsButtonColor = Color.red
                    standardButtonHeight = 35.0
                    skinsButtonHeight = 40.0
                }, label: {
                    Text("Standard")
                        .foregroundColor(Color.white)
                        .fontDesign(.rounded)
                        .frame(width: 150, height: standardButtonHeight)
                        .background(standardButtonColor)
                        .cornerRadius(10, corners: [.topLeft, .bottomLeft])
                        .disabled(isStandard)
                        .shadow(radius: 100)
                })
                
                Button(action: {
                    isStandard = false
                    isSkins = true
                    standardButtonColor = Color.red
                    skinsButtonColor = Color.gray
                    standardButtonHeight = 40
                    skinsButtonHeight = 35
                }, label: {
                    Text("Skins")
                        .foregroundColor(Color.white)
                        .fontDesign(.rounded)
                        .frame(width: 150, height: skinsButtonHeight)
                        .background(skinsButtonColor)
                        .cornerRadius(10, corners: [.topRight, .bottomRight])
                        .disabled(isSkins)
                        .shadow(radius: 100)
                })
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
