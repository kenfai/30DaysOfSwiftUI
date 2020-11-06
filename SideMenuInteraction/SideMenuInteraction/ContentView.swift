//
//  ContentView.swift
//  SideMenuInteraction
//
//  Created by Ginger on 06/11/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var sideMenuActivated: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(sideMenuActivated: $sideMenuActivated)
            
            ZStack {
                RoundedRectangle(cornerRadius: sideMenuActivated ? 32 : 0)
                    .foregroundColor(.green)
                    .shadow(radius: sideMenuActivated ? 32: 0)
                
                VStack {
                    HStack {
                        Button(action: { sideMenuActivated.toggle() }) {
                            Image("menu.list")
                                .font(.largeTitle)
                                .accentColor(.white)
                                .frame(width: 44, height: 44, alignment: .center)
                                .scaleEffect(sideMenuActivated ? 1.2 : 1.0)
                        }
                        .padding(.top, 64)
                        .padding(.leading, 32)
                        Spacer()
                    }
                    Spacer()
                }
                
                Text("Main content")
                    .font(.largeTitle)
            }
            .offset(x: sideMenuActivated ? 354 : 0)
            .scaleEffect(sideMenuActivated ? 0.7 : 1.0)
            .animation(.spring(response: 0.4))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundView: View {
    @Binding var sideMenuActivated: Bool
    
    var body: some View {
        Spacer()
            .background(Color(red: 232/255, green: 237/255, blue: 233/255))
            .edgesIgnoringSafeArea(.all)
        
        Text("Made with SwiftUI")
            .italic()
        
        VStack {
            HStack {
                Spacer()
                Button(action: { sideMenuActivated.toggle() }) {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                        .accentColor(.gray)
                        .frame(width: 44, height: 44, alignment: .center)
                }
                .padding(.trailing, 32)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
