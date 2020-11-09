//
//  CardCellView.swift
//  AppStoreLikeAnimation
//
//  Created by Ginger on 09/11/2020.
//

import SwiftUI

let screenSize = UIScreen.main.bounds

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom)
            .combined(with: .scale)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.25), radius: 16)
    }
}

struct CardCellView: View {
    @State var cardActived: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                Image("clash-of-clans")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                VStack(alignment: .leading) {
                    Text("Apple Arcade".uppercased())
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .padding([.top, .leading])
                    HStack {
                        Text("Title of the: Super App")
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 100)
                        Spacer()
                    }
                    .padding(.leading)
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.black)
                            .frame(height: 100)
                            
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Apple Arcade")
                                    .foregroundColor(Color.gray)
                                    .font(.callout)
                                Text("Super App")
                                    .foregroundColor(Color.white)
                                    .font(.callout)
                                    .fontWeight(.bold)
                                Text("The most descriptive text ever")
                                    .foregroundColor(Color.gray)
                                    .font(.callout)
                                    .padding(.bottom)
                            }
                            Button(action: {}) {
                                Text("Try It Free".uppercased())
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                
                if cardActived {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: { cardActived = false }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 64)
                                    .padding(.trailing, 32)
                                    .shadow(radius: 16)
                            }
                        }
                        Spacer()
                    }
                }
            }
            .cornerRadius(cardActived ? 0 : 16)
            .padding(cardActived ? 0 : 16)
            .onTapGesture {
                cardActived.toggle()
            }
            
            if cardActived {
                CardDetailsView().transition(.moveAndScale)
            }
        }
        .frame(height: cardActived ? screenSize.height : nil, alignment: .top)
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: cardActived)
        .animation(.easeInOut(duration: 0.5))
    }
}

struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardCellView()
    }
}
