//
//  NetworkManager.swift
//  ApiApp
//
//  Created by Кукушкин Денис Сергеевич on 20.11.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(Joke) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                DispatchQueue.main.async {
                    completion(joke)
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
    
}

