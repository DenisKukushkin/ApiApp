//
//  DogViewController.swift
//  ApiApp
//
//  Created by Denis Kukushkin on 18.11.2022.
//

import UIKit

let httpCodes = [100, 101, 102, 103, Int.random(in: 200...208), 218, 226, Int.random(in: 300...308), Int.random(in: 400...431), 440, 444, 449, 450, 451, 460, 463, 464, Int.random(in: 494...511), Int.random(in: 520...530), 561, 598, 599, 999]

class DogViewController: UIViewController {
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var dogApi: String {
        "https://http.dog/\(httpCodes.randomElement() ?? 404).jpg"
    }
    
    @IBAction func getDogImageButtonPressed() {
        fetchImage()
    }
    
}

// MARK: - Networking
extension DogViewController {
    private func fetchImage() {
        dogImageView.isHidden = true
        activityIndicator.startAnimating()
        guard let url = URL(string: dogApi) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let _ = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
                        
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.dogImageView.image = image
                self.activityIndicator.stopAnimating()
                self.dogImageView.isHidden.toggle()
            }
        }.resume()
    }
}

