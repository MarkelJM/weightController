//
//  ProfileModel.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

import Foundation
import Firebase

struct ProfileInformation {
    var firstName: String
    var lastName: String
    var address: String
    var postalCode: String
    var city: String
    var country: String
    var weight: Double?
    var birthDate: Date
    var profilePhotoURL: String?

    // Inicializador para crear instancias directamente
    init(firstName: String, lastName: String, address: String, postalCode: String, city: String, country: String, weight: Double?, birthDate: Date, profilePhotoURL: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.postalCode = postalCode
        self.city = city
        self.country = country
        self.weight = weight
        self.birthDate = birthDate
        self.profilePhotoURL = profilePhotoURL
    }

    // Inicializador para crear instancias a partir de un diccionario (Firestore)
    init(from dictionary: [String: Any]) {
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.address = dictionary["address"] as? String ?? ""
        self.postalCode = dictionary["postalCode"] as? String ?? ""
        self.city = dictionary["city"] as? String ?? ""
        self.country = dictionary["country"] as? String ?? ""
        self.weight = dictionary["weight"] as? Double
        self.birthDate = (dictionary["birthDate"] as? Timestamp)?.dateValue() ?? Date()
        self.profilePhotoURL = dictionary["profilePhotoURL"] as? String
    }
}



