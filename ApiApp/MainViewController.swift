//
//  MainViewController.swift
//  ApiApp
//
//  Created by Denis Kukushkin on 18.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    let jokeApi = "https://api.chucknorris.io/jokes/random"
    
    @IBOutlet weak var jokeScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getJokeButton(_ sender: Any) {
        getJokeButtonPressed()
    }
    
}

// MARK: - Networking
extension MainViewController {
    private func getJokeButtonPressed() {
        guard let url = URL(string: jokeApi) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                DispatchQueue.main.async {
                    self.jokeScreen.text = joke.value
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
