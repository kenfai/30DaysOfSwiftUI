//
//  ContentView.swift
//  DarkModeTest
//
//  Created by Ginger on 28/10/2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Color("AccentColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Now, is")
                            .font(.system(size: 32, weight: .black))
                            .foregroundColor(Color("labelColor"))
                            .multilineTextAlignment(.leading)
                        
                        Text(colorScheme == .light ? "Light  " : "Dark  ")
                            .font(colorScheme == .light ? Font.custom("BrushScriptMT", size: 96) : Font.custom("Skia", size: 78))
                            .foregroundColor(Color("labelColor").opacity(0.75))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 20)
                            .frame(width: 300)
                    }
                    .padding(.trailing, 80)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
