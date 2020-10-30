//
//  ContentView.swift
//  TypefaceComparison
//
//  Created by Ginger on 30/10/2020.
//

import SwiftUI

struct ContentView: View {
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .inactive, .dragging:
                return false
            case .pressing:
                return true
            }
        }
        
        var isActive: Bool {
            switch self {
            case .inactive:
                return false
            case .pressing, .dragging:
                return true
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    @GestureState private var dragState = DragState.inactive
    @State private var viewState = CGSize.zero
    @State var rotationX: Double
    
    var body: some View {
        let minimumLongPressDuration = 0.5
        /*let gesture = DragGesture()
            .onChanged{ value in
                dragState = value.translation
            }*/
        let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
            .sequenced(before: DragGesture())
            .updating($dragState) { value, state, transaction in
                switch value {
                // Long press begins
                case .first(true):
                    state = .pressing
                // Long press confirms, dragging may begin
                case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                    // Dragging ended or long press cancelled
                default:
                    state = .inactive
                }
            }
        
        
        return VStack {
            Spacer()
            ZStack {
                Text("A")
                    .font(.system(size: 400))
                    .foregroundColor(Color.red.opacity(0.5))
                    .fixedSize()
                    .offset(x: viewState.width - CGFloat(rotationX), y: viewState.height)
                
                Text("A")
                    .font(Font.custom("Futura", size: 400))
                    .foregroundColor(Color.blue.opacity(dragState.isPressing ? 0.3 : 0.5))
                    //.padding(.leading)
                    .fixedSize()
                    .offset(x: viewState.width + dragState.translation.width + CGFloat(rotationX), y: viewState.height)
                    .gesture(longPressDrag)
                    .animation(.spring())
            }
            .shadow(color: Color.black.opacity(0.25), radius: 8, x: 8, y: 8)
            .rotation3DEffect(
                .degrees(rotationX),
                axis: (x: 0.0, y: 1.0, z: 0.0))
        
            Spacer()
            
            HStack {
                Image(systemName: "0.circle")
                    .font(.system(size: 20))
                
                Slider(value: $rotationX, in: -45.0...45.0, step: 1.0)
                    .accentColor(.black)
                
                Image(systemName: "45.circle")
                    .font(.system(size: 24))
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rotationX: 0.0)
    }
}
