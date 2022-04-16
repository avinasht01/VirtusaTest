//
//  NetworkServices.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import Foundation

public enum APIResult {
    case Success(response: AnyObject?, error: Any?)
    case Error(error: Any?)
}

public struct Constants {
    public static let baseUrl = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
}

public struct ApiEndPoints {
    public static let people = "people"
    public static let rooms = "rooms"
}

public class NetworkServices: NSObject {
    
    func getDataFromServer(urlEndPoint: String, completion: @escaping(Data?) -> Void) {
    let url = Constants.baseUrl + urlEndPoint
        guard let serviceUrl = URL(string: url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let resultData = data {
                let jsonString = String(data: resultData, encoding: .utf8)
                print("the result data string: \n\(jsonString)")
            }
            completion(data)
        }.resume()
    }
    
    func downloadImageFrom(urlString: String, completion: @escaping(Data?) -> Void) {
        guard let imageUrl = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            completion(data)
                
            }.resume()
        
    }
   
}


