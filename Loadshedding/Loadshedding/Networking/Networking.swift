//
//  Networking.swift
//  Loadshedding
//
//  Created by Precious Omoroga on 2023/04/05.
//

import Foundation
class Networking {
    static let shared = Networking()
    
    let baseURLString = "https://developer.sepush.co.za/business/2.0"
    let apiToken = "E2FB12E5-CDA04791-A4FA8F19-1ED45F63"
    let timeout = 30.0
    
    func getStatus(completion: @escaping (Status?, Error?) -> ()) {
        let urlString = baseURLString + "/status"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Local", code: -1))
            return
            
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["token" : apiToken]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data,
                      error == nil else {
                    completion(nil, error)
                    return
                }
                //asyncronous
                do{
                    let status = try JSONDecoder().decode(Status.self, from: data)
                    completion(status,nil)
                } catch {
                    print(error.localizedDescription)
                    print(error)
                    completion(nil, error)
                    
                }
            }
            
            
        }
        task.resume()
    }
}
