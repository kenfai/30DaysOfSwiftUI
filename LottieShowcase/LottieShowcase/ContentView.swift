//
//  ContentView.swift
//  LottieShowcase
//
//  Created by Ginger on 08/11/2020.
//

import SwiftUI

let backgroundColour: Color = Color(red: 229/255, green: 240/255, blue: 239/255)

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(backgroundColour)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView {
                    ForEach(lottieList, id: \.self) { lottie in
                        VStack(alignment: .center) {
                            LottieView(fileName: lottie)
                                .frame(height: 200)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
