//
//  ContentView.swift
//  TextFieldAnimation
//
//  Created by Ginger on 01/11/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing = false
    @State private var something = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.91, green: 0.92, blue: 0.94, opacity: 1.0))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Group {
                    TextField("Say something..", text: $something)
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.black)
                        .accentColor(.blue)
                        .padding(.vertical, 32)
                        .padding(.horizontal, 32)
                        .background(isEditing ? Color.blue.frame(width: nil, height: nil).offset(x: 0) : Color.white.frame(width: 0, height: 0).offset(x: 64.0 - (UIScreen.main.bounds.size.width / 2.0)))
                        .cornerRadius(16)
                        .animation(.spring(response: 1.0))
                }
                .padding(.horizontal, 32)
                .onTapGesture {
                    isEditing.toggle()
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
