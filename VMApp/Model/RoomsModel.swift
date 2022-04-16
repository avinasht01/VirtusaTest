//
//  RoomsModel.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import Foundation

struct Rooms: Codable {
    var createdAt: String
    var id: String
    var isOccupied: Bool
    var maxOccupancy: Int
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case id = "id"
        case isOccupied = "isOccupied"
        case maxOccupancy = "maxOccupancy"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        isOccupied = try values.decodeIfPresent(Bool.self, forKey: .isOccupied) ?? false
        maxOccupancy = try values.decodeIfPresent(Int.self, forKey: .maxOccupancy) ?? 0
    }
    
    public init(createdAt: String, id: String, isOccupied: Bool, maxOccupancy: Int) {
        self.createdAt = createdAt
        self.id = id
        self.isOccupied = isOccupied
        self.maxOccupancy = maxOccupancy
    }
    
}

extension Rooms {
    func hasValidID() -> Bool {
        return self.id != "" ? true : false
    }
}
