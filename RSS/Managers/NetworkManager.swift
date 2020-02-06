//
//  NetworkManager.swift
//  RSS
//
//  Created by Joshu Sonawane on 2/3/20.
//  Copyright © 2020 Joshu Sonawane. All rights reserved.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    let baseURL  = "https://rss.itunes.apple.com/api/v1"
    let region   = "us"
    let media    = "apple-music"
    let feed     = "coming-soon"
    let genre    = "all"
    let explicit = "explicit.json"
    
    private init() {}
    
    func getAlbums(limit: Int = 10, completed: @escaping (DataRoot?, String?) -> Void) {
        let endpoint = baseURL + "/\(region)/\(media)/\(feed)/\(genre)/\(limit)/\(explicit)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Check Internet Connection")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil , "Invalid Response")
                return
            }
            
            guard let data = data else {
                completed(nil, "Invalid data")
                return
            }
                        
            do {
                let decoder = JSONDecoder()
                let dataRoot = try decoder.decode(DataRoot.self, from: data)
                completed( dataRoot, nil)
            } catch {
                completed(nil, "Can not decode")
            }
            
        }
        
        task.resume()
        
    }
   				
}
