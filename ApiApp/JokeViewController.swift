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
        fetchJoke()
        funEmojiLabel.isHidden = false
        funEmojiLabel.text = funEmojis.randomElement()
    }
    
}

// MARK: - Networking
extension JokeViewController {
    private func fetchJoke() {
        guard let url = URL(string: jokeApi) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                DispatchQueue.main.async {
                    self.jokeLabel.text = joke.value
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
