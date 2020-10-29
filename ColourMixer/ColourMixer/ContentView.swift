//
//  ContentView.swift
//  ColourMixer
//
//  Created by Ginger on 29/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var colourR = 0.3
    @State private var colourG = 0.4
    @State private var colourB = 0.5
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: colourR, green: colourG, blue: colourB, opacity: 1.0))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Rectangle()
                        .cornerRadius(20.0)
                        .frame(width: 320, height: 120)
                        .foregroundColor(Color(red: 1.25 - (colourR + colourG * 2.0 + colourB) / 3.0, green: 1.25 - (colourR + colourG * 2.0 + colourB) / 3.0, blue: 1.25 - (colourR + colourG * 2.0 + colourB) / 3.0, opacity: 0.8))
                    HStack {
                        Text("Red: \(Int(self.colourR * 255.0))")
                        Text("Green: \(Int(self.colourG * 255.0))")
                        Text("Blue: \(Int(self.colourB * 255.0))")
                    }
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(Color(red: colourR, green: colourG, blue: colourB, opacity: 1.0))
                }
                .padding(.top)
                
                Rectangle()
                    .hidden()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .shadow(radius: 30)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "r.circle")
                                .foregroundColor(Color.red.opacity(0.8))
                                .font(.system(size: 20))
                            
                            Slider(value: $colourR, in: 0.0...1.0)
                            
                            Image(systemName: "r.circle.fill")
                                .foregroundColor(Color.red.opacity(0.8))
                                .font(.system(size: 20))
                        }
                        .padding()
                        
                        HStack {
                            Image(systemName: "g.circle")
                                .foregroundColor(Color.green.opacity(0.8))
                                .font(.system(size: 20))
                            
                            Slider(value: $colourG, in: 0.0...1.0)
                            
                            Image(systemName: "g.circle.fill")
                                .foregroundColor(Color.green.opacity(0.8))
                                .font(.system(size: 20))
                        }
                        .padding()
                        
                        HStack {
                            Image(systemName: "b.circle")
                                .foregroundColor(Color.blue.opacity(0.8))
                                .font(.system(size: 20))
                            
                            Slider(value: $colourB, in: 0.0...1.0)
                            
                            Image(systemName: "b.circle.fill")
                                .foregroundColor(Color.blue.opacity(0.8))
                                .font(.system(size: 20))
                        }
                        .padding()
                    }
                }
                .padding()
                
                Text("a little work with 🌈")
                    .foregroundColor(Color(red: 1.25 - max(colourR, max(colourG, colourB)), green: 1.25 - max(colourR, max(colourG, colourB)), blue: 1.25 - max(colourR, max(colourG, colourB)), opacity: 0.75))
                    .font(.system(size: 18, weight: .regular))
                    .italic()
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
