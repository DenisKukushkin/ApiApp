//
//  JokeViewController.swift
//  ApiApp
//
//  Created by Denis Kukushkin on 18.11.2022.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var funEmojiLabel: UILabel!
   
    private let jokeApi = "https://api.chucknorris.io/jokes/random"
    private let funEmojis = ["😂", "🤣", "😅", "😁", "😄", "🤪", "😀", "😃", "😝", "🤓", "👻", "😹", "🙉"]
    
    @IBAction func getJokeButtonPressed() {
        //fetchJoke()
        fetchData(from: jokeApi)
        funEmojiLabel.isHidden = false
        funEmojiLabel.text = funEmojis.randomElement()
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { joke in
            self.jokeLabel.text = joke.value
        }
    }
    
}


