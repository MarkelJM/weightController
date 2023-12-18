//
//  Profile+Firebase.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

import Foundation

extension ProfileInformation {
    func toFirestoreData() -> [String: Any] {
        var data: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName
            // ... otros campos
        ]
        if let profilePhotoURL = profilePhotoURL {
            data["profilePhotoURL"] = profilePhotoURL
        }
        return data
    }
}
