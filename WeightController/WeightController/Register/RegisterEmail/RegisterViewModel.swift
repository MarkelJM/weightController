//
//  RegisterViewModel.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    @Published var showVerificationSheet: Bool = false
    @Published var isEmailVerified: Bool = false
    @Published var errorMessage: String? = nil

    private var authManager = FirebaseAuthManager()

    func register() {
        guard password == repeatPassword else {
            errorMessage = "Las contraseñas no coinciden."
            return
        }

        authManager.register(email: email, password: password) { [weak self] success, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else if success {
                    self?.showVerificationSheet = true
                }
            }
        }
    }

    func checkEmailVerification() {
        if let user = Auth.auth().currentUser, !user.isEmailVerified {
            user.reload { [weak self] error in
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else {
                    self?.isEmailVerified = user.isEmailVerified
                    if user.isEmailVerified {
                        self?.showVerificationSheet = false
                        // cambiar vista
                    }
                }
            }
        }
    }
}
