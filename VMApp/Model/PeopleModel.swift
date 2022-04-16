//
//  PeopleModel.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import Foundation
import UIKit

struct People: Codable {
    var createdAt: String
    var firstName: String
    var lastName: String
    var avatar: String
    var email: String
    var jobTitle: String
    var favouriteColor: String
    var id: String
    var peopleData: PeopleData?
   
    enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case firstName = "firstName"
        case lastName = "lastName"
        case avatar = "avatar"
        case email = "email"
        case jobTitle = "jobtitle"
        case favouriteColor = "favouriteColor"
        case id = "id"
        case peopleData = "data"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar) ?? ""
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        jobTitle = try values.decodeIfPresent(String.self, forKey: .jobTitle) ?? ""
        favouriteColor = try values.decodeIfPresent(String.self, forKey: .favouriteColor) ?? ""
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        peopleData = try values.decodeIfPresent(PeopleData.self, forKey: .peopleData) ?? PeopleData(from: decoder)
    }
    
    public init(createdAt: String, firstName: String, lastName: String, email: String,avatar: String, jobTitle: String, favouriteColor: String, id: String, peopleData: PeopleData?) {
        self.createdAt = createdAt
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.avatar = avatar
        self.jobTitle = jobTitle
        self.favouriteColor = favouriteColor
        self.id = id
        self.peopleData = nil
    }
    
}

struct PeopleData: Codable {
    var body: String
    var fromId: String
    var id: String
    var meetingId: String
    var title: String
    var toId: String

    enum CodingKeys: String, CodingKey {
        case body = "body"
        case fromId = "fromId"
        case id = "id"
        case meetingId = "meetingid"
        case title = "title"
        case toId = "toId"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        body = try values.decodeIfPresent(String.self, forKey: .body) ?? ""
        fromId = try values.decodeIfPresent(String.self, forKey: .fromId) ?? ""
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        meetingId = try values.decodeIfPresent(String.self, forKey: .meetingId) ?? ""
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        toId = try values.decodeIfPresent(String.self, forKey: .toId) ?? ""
    }
}

extension People {
    
    func hasValidEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
