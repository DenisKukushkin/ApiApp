//
//  DogViewController.swift
//  ApiApp
//
//  Created by Denis Kukushkin on 18.11.2022.
//

import UIKit

let httpCodes = [
                100, 101, 102, 103, Int.random(in: 200...208), 218, 226,
                Int.random(in: 300...308),Int.random(in: 400...431), 440,
                444, 449, 450, 451, 460, 463, 464, Int.random(in: 494...511),
                Int.random(in: 520...530), 561, 598, 599, 999
]

class DogViewController: UIViewController {
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogEmojiLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var dogApi: String {
        "https://http.dog/\(httpCodes.randomElement() ?? 404).jpg"
    }
    
    @IBAction func getDogImageButtonPressed() {
        dogEmojiLabel.isHidden = false
        activityIndicator.startAnimating()
        fetchImage()
    }
    
    private func fetchImage() {
        DispatchQueue.global().async {
            guard let imageData = NetworkManager.shared.fetchImage(from: self.dogApi) else { return }
            DispatchQueue.main.async {
                self.dogImageView.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
}

//// MARK: - Networking
//extension DogViewController {
//    private func fetchImage() {
//        DispatchQueue.global().async {
//            guard let url = URL(string: self.dogApi) else { return }
//            guard let imageData = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                self.dogImageView.image = UIImage(data: imageData)
//                self.activityIndicator.stopAnimating()
//            }
//        }
//    }
//}

