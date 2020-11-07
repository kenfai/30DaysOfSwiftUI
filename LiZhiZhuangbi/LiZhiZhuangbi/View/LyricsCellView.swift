//
//  LyricsCellView.swift
//  LiZhiZhuangbi
//
//  Created by Ginger on 07/11/2020.
//

import SwiftUI

let zhuangbiRed: Color = Color(red: 239 / 255, green: 40 / 255, blue: 24 / 255)

struct LyricsCellViewModel: View {
    var lyrics: Lyrics
    
    var body: some View {
        ZStack {
            Text(LyricsCellViewModel(lyrics: lyrics).getLyrics())
                .font(Font.custom("SourceHanSerifSC-Heavy", size: 40))
                .multilineTextAlignment(.center)
                .padding()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("——《\(LyricsCellViewModel(lyrics: lyrics).getTitle())》")
                        .font(Font.custom("SourceHanSerifSC-Heavy", size: 32))
                        .foregroundColor(zhuangbiRed)
                        .padding()
                }
            }
        }
    }
}

struct LyricsCellView_Previews: PreviewProvider {
    static let lyrics = Lyrics(id: 0, lyrics: "lyrics", title: "title", videoId: "videoID")
    
    static var previews: some View {
        LyricsCellView(lyrics: lyrics)
    }
}
