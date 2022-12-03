//
//  DataManager.swift
//  ApiApp
//
//  Created by Denis Kukushkin on 03.12.2022.
//

import Foundation

class DataManager {
 
    static let shared = DataManager()
    private init() {}
    
    let jokeApi = "https://api.chucknorris.io/jokes/random"

    let funEmojis = [
        "😂", "🤣", "😅", "😁", "😄", "🤪",
        "😀", "😃", "😝", "🤓", "👻", "😹", "🙉"
    ]
    
    private let httpCodes = [
        100, 101, 102, 103, Int.random(in: 200...208), 218, 226,
        Int.random(in: 300...308),Int.random(in: 400...431), 440,
        444, 449, 450, 451, 460, 463, 464, Int.random(in: 494...511),
        Int.random(in: 520...530), 561, 598, 599, 999
    ]
    
    var dogApi: String {
        "https://http.dog/\(httpCodes.randomElement() ?? 404).jpg"
    }
    
    
}
