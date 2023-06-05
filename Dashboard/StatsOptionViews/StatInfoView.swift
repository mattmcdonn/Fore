//
//  StatInfo.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-05.
//

import SwiftUI

struct StatInfoView: View {
    var body: some View {
        Image(systemName: "arrow.counterclockwise").resizable().frame(width: 80, height: 80).bold()
    }
}

struct StatInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StatInfoView()
    }
}
