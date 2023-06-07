//
//  AllStatReset.swift
//  Fore
//
//  Created by Matthew McDonald on 2023-06-05.
//

import SwiftUI

struct AllStatReset: View {
    
    @State var resetDisabled = false
    @State var resetButtonColor = Color.red
    
    var body: some View {
        VStack{
            
            Image(systemName: "arrow.counterclockwise").resizable().frame(width: 80, height: 80).bold().padding()
            Text("Reset All Statistics").font(.system(size: 20))
            
            
            Button(action: {
                resetDisabled = true
                resetButtonColor = Color.gray
            }, label: {
                Text("Reset").frame(width: 100, height: 40).foregroundColor(.white).background(resetButtonColor).cornerRadius(5).disabled(resetDisabled)
            }).padding()
            
            HStack{
                Image(systemName: "exclamationmark.circle")
                Text("Resetting will permanently remove all existing saved statistics in all play modes. \nThis action cannot be undone.")
            }.padding()
        }
    }
}

struct AllStatReset_Previews: PreviewProvider {
    static var previews: some View {
        AllStatReset()
    }
}
