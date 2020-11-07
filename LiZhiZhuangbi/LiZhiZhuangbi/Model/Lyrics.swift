//
//  Lyrics.swift
//  LiZhiZhuangbi
//
//  Created by Ginger on 07/11/2020.
//

import Foundation

struct Sheet: Decodable {
    var sheet1: [Lyrics]
}

struct Lyrics: Identifiable, Decodable {
    public var id: Int
    public var lyrics: String
    public var title: String
    public var videoId: String
    
    var videoURL: URL? {
        let urlPrefix: String = String("https://www.youtube.com/embed/")
        return URL(string: urlPrefix + videoId)
    }
}
