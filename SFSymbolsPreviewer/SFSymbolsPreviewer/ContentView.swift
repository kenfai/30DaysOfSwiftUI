//
//  ContentView.swift
//  SFSymbolsPreviewer
//
//  Created by Ginger on 05/11/2020.
//

import SwiftUI

var weightList: [Font.Weight] = [.ultraLight, .thin, .light, .regular, .medium, .semibold, .bold, .heavy, .black]


struct SymbolDetail: View {
    var symbol: String
    
    @State var colorR: Double
    @State var colorG: Double
    @State var colorB: Double
    
    @State var symbolWeight: Font.Weight
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: symbol)
                .font(.system(size: 60, weight: symbolWeight))
                .foregroundColor(Color(red: colorR, green: colorG, blue: colorB))
                .padding()
            
            Text(symbol)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 220)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                VStack {
                    HStack {
                        Image(systemName: "r.circle")
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                        
                        Slider(value: $colorR, in: 0.0...1.0)
                            .accentColor(Color.red.opacity(colorR))
                        
                        Image(systemName: "r.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                    }
                    .padding(.bottom)
                    HStack {
                        Image(systemName: "g.circle")
                            .foregroundColor(.green)
                            .font(.system(size: 20))
                        
                        Slider(value: $colorG, in: 0.0...1.0)
                            .accentColor(Color.green.opacity(colorG))
                        
                        Image(systemName: "g.circle.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 20))
                    }
                    .padding(.bottom)
                    HStack {
                        Image(systemName: "b.circle")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                        
                        Slider(value: $colorB, in: 0.0...1.0)
                            .accentColor(Color.blue.opacity(colorB))
                        
                        Image(systemName: "b.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                    }
                    .padding(.bottom)
                }
                .padding()
            }
            .padding()
        }
    }
}

struct ContentView: View {
    @State private var weightIndex = 0
    
    let columns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(symbols, id: \.self) { symbol in
                            NavigationLink(
                                destination: SymbolDetail(
                                    symbol: symbol,
                                    colorR: 0.0,
                                    colorG: 0.0,
                                    colorB: 0.0,
                                    symbolWeight: weightList[weightIndex]
                                )) {
                                VStack {
                                    Image(systemName: symbol)
                                    .font(.system(size: 40, weight: weightList[weightIndex]))
                                    .padding(30)
                                    
                                    Text(symbol)
                                        .font(.system(size: 12, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                }
                                .foregroundColor(Color.black)
                                .padding(.bottom)
                            }
                            
                        }
                    }
                }
                .padding()
                .navigationBarTitle(Text("SF Symbols"))
             
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            weightIndex -= 1
                        }) {
                            Image(systemName: "minus.circle")
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity)
                        .disabled(weightIndex < 1)
                        
                        Button(action: {
                            if weightIndex < weightList.count - 1 {
                                weightIndex += 1
                            }
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 50)
                    .background(Color.white.opacity(0.9))
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
