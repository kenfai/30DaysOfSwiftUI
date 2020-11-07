//
//  LyricsCellViewModel.swift
//  LiZhiZhuangbi
//
//  Created by Ginger on 07/11/2020.
//

import Foundation

public class LyricsCellViewModel {
    private var lyrics: Lyrics
    
    init(lyrics: Lyrics) {
        self.lyrics = lyrics
    }
    
    func getLyrics() -> String {
        return lyrics.lyrics
    }
    
    func getTitle() -> String {
        return lyrics.title
    }
}
