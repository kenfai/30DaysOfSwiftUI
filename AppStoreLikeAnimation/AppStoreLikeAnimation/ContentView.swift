//
//  ContentView.swift
//  AppStoreLikeAnimation
//
//  Created by Ginger on 09/11/2020.
//

import SwiftUI

extension CGRect {
    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}

struct ContentView: View {
    var body: some View {
        CardListView()
    }
}

struct CardListView: View {
    @State var cardActived: Bool = false
    
    var body: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { _ in
                CardCellView()
            }
        }
        .statusBar(hidden: cardActived)
        .edgesIgnoringSafeArea(cardActived ? .all : .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
