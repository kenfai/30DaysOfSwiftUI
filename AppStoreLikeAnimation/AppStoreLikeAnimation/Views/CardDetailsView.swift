//
//  CardDetailsView.swift
//  AppStoreLikeAnimation
//
//  Created by Ginger on 09/11/2020.
//

import SwiftUI

struct CardDetailsView: View {
    var body: some View {
        VStack {
            CardViewBody(bodyString: testBodyString)
            CardViewFooter()
        }
    }
}

struct CardViewBody: View {
    let bodyString: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(bodyString)
                .font(.body)
                .padding()
                .background(Color.white)
                .lineLimit(nil)
                .frame(height: 1000)
                .autocapitalization(.allCharacters)
        }
    }
}

struct CardViewFooter: View {
    var body: some View {
        ZStack {
            Spacer()
                .frame(width: UIScreen.main.bounds.width, height: 180)
            Button(action: {}) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .offset(y: -2)
                    Text("Share Story")
                }
                .foregroundColor(Color.blue)
            }
            .padding(.horizontal, 60)
            .padding(.vertical)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
        .background(Color.white)
        .fixedSize()
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView()
    }
}
