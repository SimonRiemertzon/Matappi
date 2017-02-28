//
//  JsonHandler.swift
//  Matapi
//
//  Created by Simon Riemertzon on 28/02/17.
//  Copyright © 2017 Simon Riemertzon. All rights reserved.
//

import Foundation

//var latestSearchResult: [[String:Any]] = []



    
    func getData(searchText : String, onData : @escaping ([[String: Any]]) -> Void) {
        let urlString = "http://www.matapi.se/foodstuff?query=\(searchText)"
        
        if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: safeUrlString) {
            
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (maybeData: Data?,response: URLResponse?,error: Error?) in
                
                if let actualData = maybeData {
                    let jsonOptions = JSONSerialization.ReadingOptions()
                    
                    do {
                        if let parsed = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String:Any]] {
                            NSLog("Parsed")
                            onData(parsed)
                        } else {
                            NSLog("Failed to cast to json")
                        }
                    }
                    catch let parseError {
                        NSLog("Failed to parse json: \(parseError)")
                    }
                } else {
                    NSLog("No data received")
                }
            }
            task.resume()
            
            
        } else {
            NSLog("Failed to create URL")
        }

    }

    func getFoodItemData() {
    
}

    




