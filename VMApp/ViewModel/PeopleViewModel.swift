//
//  PeopleViewModel.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import Foundation

protocol PeopleViewModelDelegate: NSObjectProtocol {
    func didReceivePeopleList()
    func didReceiveError()
}

class PeopleViewModel: NSObject {
    weak var delegate: PeopleViewModelDelegate?
    var peopleArray = [People]()
    
    func getAllListOfPeople() {
        NetworkServices().getDataFromServer(urlEndPoint: ApiEndPoints.people, completion: { resultData in
            if let data = resultData {
                do {
                    let peopleList = try JSONDecoder().decode([People].self, from: data)
                    print("the people list returned from server: \(peopleList)")
                    self.peopleArray = peopleList
                    self.delegate?.didReceivePeopleList()
                   
                } catch let error {
                    print("error found while decoding json: \(error)")
                    self.delegate?.didReceiveError()
                }
            }
        })
    }
    
}

extension NSDictionary {
    
    func JSONString() -> String {
        var jsonString: String = ""
        
        do {
            let jsonData: Data = try JSONSerialization .data(withJSONObject: self, options: JSONSerialization.WritingOptions(rawValue: 0))
            jsonString = String(data: jsonData, encoding: String.Encoding.utf8) ?? ""
        } catch let error as NSError {
           print("the json error: \(error)")
        }
        
        return jsonString
    }
}
