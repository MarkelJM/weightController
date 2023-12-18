//
//  ProfileModel.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

struct ProfileInformation {
    var firstName: String
    var lastName: String
    var profilePhotoURL: String?
    // ... otros campos

    init(from dictionary: [String: Any]) {
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.profilePhotoURL = dictionary["profilePhotoURL"] as? String
        // ... inicializa otros campos
    }
}

