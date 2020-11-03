//
//  ContentView.swift
//  BreathingAnimation
//
//  Created by Ginger on 03/11/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //Spacer()
                
                ZStack {
                    TwoCircles(colorPrimary: Color.red, moveInOut: $moveInOut)
                        .opacity(0.5)
                    TwoCircles(colorPrimary: Color.green, moveInOut: $moveInOut)
                        .opacity(0.5)
                        .rotationEffect(.degrees(60))
                    TwoCircles(colorPrimary: Color.blue, moveInOut: $moveInOut)
                        .opacity(0.5)
                        .rotationEffect(.degrees(120))
                }
                .rotationEffect(.degrees(rotateInOut ? 90 : 0))
                .scaleEffect(scaleInOut ? 1 : 1/4)
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
                .onAppear {
                    rotateInOut.toggle()
                    scaleInOut.toggle()
                    moveInOut.toggle()
                }
                
                //Spacer()
            }
        }
    }
}

struct TwoCircles: View {
    @State var colorPrimary: Color
    @Binding var moveInOut: Bool
    
    var body: some View {
        ZStack {
            Group {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [colorPrimary, Color.white]), startPoint: .top, endPoint: .bottom))
            }
            .frame(width: 120, height: 120, alignment: .center)
            .offset(y: moveInOut ? -60 : 0)
            
            Group {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [colorPrimary, Color.white]), startPoint: .bottom, endPoint: .top))
            }
            .frame(width: 120, height: 120, alignment: .center)
            .offset(y: moveInOut ? 60 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
