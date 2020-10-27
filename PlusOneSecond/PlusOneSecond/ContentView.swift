//
//  ContentView.swift
//  PlusOneSecond
//
//  Created by Ginger on 27/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var timeCount: Double = 0.0
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timeCount -= 0.1
        }
    }
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .lastTextBaseline) {
                    Text(timeString(time: timeCount))
                        .font(.system(size: 100, weight: .black))
                        .italic()
                        .frame(width: 300, height: 100, alignment: .trailing)
                        .foregroundColor(self.timeCount > 0 ? Color.white : Color.red)
                        .onAppear(perform: {
                            let _ = self.timer
                        })
                
                    Text("s")
                        .font(.system(size: 50, weight: .black))
                        .italic()
                        .foregroundColor(Color.white)
                }
                .padding(.top, 100)
                
                Spacer()
                
                Button(action: {
                    self.timeCount += 1
                }) {
                    Text("+1s")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 80)
                .background(Color.green)
                .cornerRadius(20)
            }
            .shadow(color: Color(.black).opacity(0.4), radius: 20, x: 0.0, y: 0.0)
            .padding(.bottom, 100)
        }
    }
    
    func timeString(time: Double) -> String {
        return String(format: "%.1f", time)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
