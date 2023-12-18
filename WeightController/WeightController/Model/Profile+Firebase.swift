//
//  Profile+Firebase.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

import Foundation
import Firebase


// Extensión para convertir la información del perfil en datos para Firestore
extension ProfileInformation {
    func toFirestoreData() -> [String: Any] {
        var data: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "address": address,
            "postalCode": postalCode,
            "city": city,
            "country": country,
            "birthDate": Timestamp(date: birthDate)
        ]
        if let weight = weight {
            data["weight"] = weight
        }
        if let profilePhotoURL = profilePhotoURL {
            data["profilePhotoURL"] = profilePhotoURL
        }
        return data
    }
}
