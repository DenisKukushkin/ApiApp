//
//  DogViewController.swift
//  ApiApp
//
//  Created by Denis Kukushkin on 18.11.2022.
//

import UIKit

class DogViewController: UIViewController {
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogEmojiLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func getDogImageButtonPressed() {
        dogEmojiLabel.isHidden = false
        activityIndicator.startAnimating()
        fetchImage()
    }
    
    private func fetchImage() {
        DispatchQueue.global().async {
            guard let imageData = NetworkManager.shared.fetchImage(from: DataManager.shared.dogApi) else { return }
            DispatchQueue.main.async {
                self.dogImageView.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
}


