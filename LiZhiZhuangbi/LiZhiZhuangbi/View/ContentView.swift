//
//  ContentView.swift
//  LiZhiZhuangbi
//
//  Created by Ginger on 07/11/2020.
//

import SwiftUI

let backgroundColour: Color = Color(red: 252 / 255, green: 247 / 255, blue: 247 / 255)
let defaultLyrics = Lyrics(id: 0, lyrics: "lyrics", title: "title", videoId: "videoID")

struct ContentView: View {
    @ObservedObject var lyricsListViewModel = LyricsListViewModel()
    
    var body: some View {
        return ZStack {
            Rectangle()
                .foregroundColor(backgroundColour)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                /*List(lyricsListViewModel.lyricsList.shuffled()) { lyrics in
                    HStack {
                        Text(lyrics.lyrics)
                        Text(lyrics.title)
                    }
                }*/
                VStack {
                    LyricsCellView(lyrics: lyricsListViewModel.lyricsList.shuffled().first ?? defaultLyrics)
                        .padding(.bottom, 400)
                    Spacer()
                }
                VStack {
                    Spacer()
                    Button(action: {
                        self.lyricsListViewModel.shuffle()
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 200, height: 200, alignment: .center)
                                .foregroundColor(Color.black)
                                .shadow(radius: 32)
                            Group {
                                Text("Zhuang")
                                    .font(.system(size: 56, weight: .regular, design: .serif))
                                    .offset(y: -19)
                                    .opacity(0.7)
                                Text("Bi")
                                    .font(.system(size: 72, weight: .bold, design: .serif))
                                    .offset(x: 40, y: 17)
                                    .opacity(0.9)
                            }
                            .foregroundColor(Color.white)
                        }
                    }
                    .padding()
                }
            }
        }
        .animation(.easeInOut)
        .onAppear(perform: lyricsListViewModel.load)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
