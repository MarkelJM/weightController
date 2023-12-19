//
//  ProfileRegisterViewModel.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//


import Foundation
import SwiftUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class ProfileRegisterViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var address: String = ""
    @Published var postalCode: String = ""
    @Published var city: String = ""
    @Published var country: String = ""
    @Published var weight: Double? = nil
    @Published var birthDate: Date = Date()
    @Published var profileImage: UIImage? = nil
    @Published var errorMessage: String? = nil

    private var firestoreManager = FirestoreManager()

    func registerProfile() {
        let profile = ProfileInformation(
            firstName: firstName,
            lastName: lastName,
            address: address,
            postalCode: postalCode,
            city: city,
            country: country,
            weight: weight,
            birthDate: birthDate
        )

        if let image = profileImage {
            uploadImage(image) { [weak self] url in
                if let url = url {
                    var updatedProfile = profile
                    updatedProfile.profilePhotoURL = url.absoluteString
                    self?.saveProfileToFirestore(updatedProfile)
                } else {
                    self?.errorMessage = "Error al subir la imagen."
                }
            }
        } else {
            saveProfileToFirestore(profile)
        }
    }

    private func uploadImage(_ image: UIImage, completion: @escaping (URL?) -> Void) {
        let storageRef = Storage.storage().reference().child("profileImages/\(UUID().uuidString).jpg")
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            storageRef.putData(imageData, metadata: nil) { metadata, error in
                if error != nil {
                    completion(nil)
                } else {
                    storageRef.downloadURL { url, error in
                        guard let downloadURL = url else {
                            completion(nil)
                            return
                        }
                        completion(downloadURL)
                    }
                }
            }
        } else {
            completion(nil)
        }
    }

    private func saveProfileToFirestore(_ profile: ProfileInformation) {
        firestoreManager.createProfile(profile: profile) { [weak self] success, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else if success {
                // Navegar a la siguiente vista o mostrar confirmación
            }
        }
    }
}

/*
import Foundation
import SwiftUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class ProfileRegisterViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var address: String = ""
    @Published var postalCode: String = ""
    @Published var city: String = ""
    @Published var country: String = ""
    @Published var weight: Double? = nil
    @Published var birthDate: Date = Date()
    @Published var profileImage: UIImage? = nil
    
    @Published var errorMessage: String? = nil

    private var firestoreManager = FirestoreManager()

    func registerProfile() {
        let profile = ProfileInformation(
            firstName: firstName,
            lastName: lastName,
            address: address,
            postalCode: postalCode,
            city: city,
            country: country,
            weight: weight,
            birthDate: birthDate
            //profileImage: profileImage
        )

        // Primero, subir la imagen si existe
        if let image = profileImage {
            uploadImage(image) { [weak self] url in
                if let url = url {
                    // Si la imagen se subió correctamente, guardar el perfil con la URL de la imagen
                    var updatedProfile = profile
                    updatedProfile.profilePhotoURL = url.absoluteString
                    self?.saveProfileToFirestore(updatedProfile)
                } else {
                    self?.errorMessage = "Error al subir la imagen."
                }
            }
        } else {
            // Si no hay imagen, guardar el perfil directamente
            saveProfileToFirestore(profile)
        }
    }

    private func uploadImage(_ image: UIImage, completion: @escaping (URL?) -> Void) {
        let storageRef = Storage.storage().reference().child("profileImages/\(UUID().uuidString).jpg")
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            storageRef.putData(imageData, metadata: nil) { metadata, error in
                if error != nil {
                    completion(nil)
                } else {
                    storageRef.downloadURL { url, error in
                        guard let downloadURL = url else {
                            completion(nil)
                            return
                        }
                        completion(downloadURL)
                    }
                }
            }
        } else {
            completion(nil)
        }
    }

    private func saveProfileToFirestore(_ profile: ProfileInformation) {
        firestoreManager.createProfile(profile: profile) { [weak self] success, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else if success {
                // Navegar a la siguiente vista o mostrar confirmación
            }
        }
    }
    
    func loadProfile() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        firestoreManager.getProfile(for: userId) { [weak self] profile, error in
            if let profile = profile {
                DispatchQueue.main.async {
                    self?.firstName = profile.firstName
                    self?.lastName = profile.lastName
                    // ... actualiza otros campos
                    if let profilePhotoURL = profile.profilePhotoURL {
                        self?.loadImage(from: profilePhotoURL)
                    }
                }
            } else if let error = error {
                self?.errorMessage = error.localizedDescription
            }
        }
    }

    private func loadImage(from url: String) {
        // Aquí  implementar la carga de la imagen desde la URL
        // y actualizar `profileImage`
    }

}
*/
