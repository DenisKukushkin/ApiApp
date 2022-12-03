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
    
    @IBAction func getJokeButtonPressed() {
        fetchData(from: DataManager.shared.jokeApi)
        funEmojiLabel.isHidden = false
        funEmojiLabel.text = DataManager.shared.funEmojis.randomElement()
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { joke in
            self.jokeLabel.text = joke.value
        }
    }
    
}


