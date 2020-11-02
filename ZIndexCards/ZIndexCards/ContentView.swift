//
//  ContentView.swift
//  ZIndexCards
//
//  Created by Ginger on 02/11/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var list: [Int] = [0, -1, -2, -3]
    @State private var color: [Color] = [.red, .yellow, .blue, .green]
    @State private var content: [String] = ["Triangle", "Square", "Hexagon", "Circle"]
    @State private var degrees: [Double] = [-9, 9, 18, 0]
    
    enum DragState {
        case inactive
        case active(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive:
            return .zero
            case .active(let t):
                return t
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .active:
                return true
            }
        }
    }
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
    
    var body: some View {
        let gesture = DragGesture()
            .updating($dragState) { value, dragInfo, _ in
                dragInfo = .active(translation: value.translation)
            }
        
        return ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.95, green: 0.94, blue: 0.92, opacity: 1.0))
                .edgesIgnoringSafeArea(.all)
            ZStack {
                ForEach(0..<list.count, id: \.self) { i in
                    CardView(index: Double(list[i]), content: content[i], color: color[i])
                        .scaleEffect(list[i] == 0 ? (dragState.isActive ? 1.2 : 1.0) : 1.0)
                        .gesture(gesture
                            .onEnded { _ in
                                list = f(list)
                                degrees[i] = Double.random(in: -24...24)
                            })
                        .offset(
                            x: list[i] == 0 ? viewState.width + dragState.translation.width * 0.8 : .zero,
                            y: list[i] == 0 ? viewState.height + dragState.translation.height * 0.8 : .zero
                        )
                        .rotationEffect(Angle(degrees: degrees[i]))
                        .animation(.spring())
                }
            }
        }
    }
    func f(_ list: [Int]) -> [Int] {
        var a = list
        let b = a.removeLast()
        a.insert(b, at: 0)
        
        return a
    }
}

struct CardView: View {
    let index: Double
    let content: String
    let color: Color
    
    var body: some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(color)
                .shadow(color: Color.black.opacity(0.25), radius: 16)
            if content == "Circle" {
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100, alignment: .center)
                    .offset(x: 62, y: 130)
                Image(systemName: "suit.heart.fill")
                    .font(.system(size: 108))
            } else if content == "Square" {
                Spacer()
                    .background(Color.white)
                    .frame(width: 84, height: 84, alignment: .center)
                    .offset(x: 62, y: 130)
                Image(systemName: "suit.club.fill")
                    .font(.system(size: 108))
            } else if content == "Hexagon" {
                Hexagon()
                    .frame(width: 130, height: 130)
                    .offset(x: 129 - 67, y: 273 - 135)
                    .foregroundColor(Color.white)
                Image(systemName: "suit.diamond.fill")
                    .font(.system(size: 108))
            } else {
                Triangle()
                    .frame(width: 130, height: 130)
                    .offset(x: 129 - 67, y: 273 - 135)
                    .foregroundColor(Color.white)
                Image(systemName: "suit.spade.fill")
                    .font(.system(size: 108))
            }
        }
        .frame(width: 264, height: 400, alignment: .center)
        .zIndex(index)
    }
}

struct Triangle: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                let width = min(geo.size.width, geo.size.height)
                let height = width
                let middle = width / 2
                let topHeight = 98/130 * height
                let topWidth = topHeight / sqrt(3)
                
                path.addLines([
                    CGPoint(x: middle, y: 0),
                    CGPoint(x: middle - topWidth, y: topHeight),
                    CGPoint(x: middle + topWidth, y: topHeight)
                ])
            }
        }
    }
}

struct Hexagon: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                let width = min(geo.size.width, geo.size.height)
                let height = width
                let middle = width / 2
                let topHeight = 98/130 * height
                let topWidth = topHeight / sqrt(6)
                
                path.addLines([
                    CGPoint(x: middle, y: 0),
                    CGPoint(x: middle - topWidth, y: 30),
                    CGPoint(x: middle - topWidth, y: 60),
                    CGPoint(x: middle, y: 90),
                    CGPoint(x: middle + topWidth, y: 60),
                    CGPoint(x: middle + topWidth, y: 30),
                ])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
