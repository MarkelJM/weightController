//
//  NavigationState.swift
//  WeightController
//
//  Created by Markel Juaristi on 12/12/23.
//

import Foundation
import SwiftUI

struct NavigationState: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch appState.currentView {
        case .login:
            LoginView(appState: appState)
        }
    }
}
