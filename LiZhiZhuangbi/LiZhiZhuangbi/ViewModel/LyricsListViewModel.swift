//
//  LyricsListViewModel.swift
//  LiZhiZhuangbi
//
//  Created by Ginger on 07/11/2020.
//
import Combine
import Foundation
//import SwiftUI

public class LyricsListViewModel: ObservableObject {
    public let willChange = ObservableObjectPublisher()
    
    @Published var lyricsList = [Lyrics]() {
        willSet {
            objectWillChange.send()
        }
    }
    
    func shuffle() {
        lyricsList = lyricsList.shuffled()
    }
    
    func load() {
        guard let url = URL(string: "https://api.sheety.co/61d2a4b0a50f208d01c00ba8f8b7b4c7/liZhi/sheet1") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                guard let data = data else { return }
                let sheet = try JSONDecoder().decode(Sheet.self, from: data)
                DispatchQueue.main.async {
                    print(sheet.sheet1)
                    self.lyricsList = sheet.sheet1
                }
            } catch {
                print("Failed to decode: ", error.localizedDescription)
            }
        }.resume()
    }
}
