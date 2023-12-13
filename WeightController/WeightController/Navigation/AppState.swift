//
//  AppState.swift
//  WeightController
//
//  Created by Markel Juaristi on 12/12/23.
//

import Foundation

class AppState: ObservableObject {
    @Published var currentView: AppView = .login
    
    enum AppView {
        case login
        case forgotPassword
    }

}

