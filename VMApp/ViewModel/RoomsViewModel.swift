//
//  RoomsViewModel.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import Foundation

protocol RoomsViewModelDelegate: NSObjectProtocol {
    func didReceiveRoomsList()
    func didReceiveError()
}

class RoomsViewModel: NSObject {
    weak var delegate: RoomsViewModelDelegate?
    var roomsArray = [Rooms]()
    
    func getAllListOfRooms() {
        NetworkServices().getDataFromServer(urlEndPoint: ApiEndPoints.rooms, completion: { [self] resultData in
            if let data = resultData {
                do {
                    let roomsList = try JSONDecoder().decode([Rooms].self, from: data)
                    print("the rooms list returned from server: \(roomsList)")
                    self.roomsArray = roomsList
                    self.delegate?.didReceiveRoomsList()
                   
                } catch let error {
                    print("error found while decoding json: \(error)")
                    self.delegate?.didReceiveError()
                }
            }
            
        })
    }
    
}
