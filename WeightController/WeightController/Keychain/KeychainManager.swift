//
//  KeychainManager.swift
//  WeightController
//
//  Created by Markel Juaristi on 12/12/23.
//

import Foundation
import KeychainSwift

class KeychainManager: ObservableObject {
    private let keychain = KeychainSwift()

    private let tokenKey = "authToken"

    func saveToken(_ token: String) {
        keychain.set(token, forKey: tokenKey)
    }

    func getToken() -> String? {
        return keychain.get(tokenKey)
    }

    func deleteToken() {
        keychain.delete(tokenKey)
    }
}
