//
//  LoginView.swift
//  WeightController
//
//  Created by Markel Juaristi on 12/12/23.
//

import SwiftUI



struct LoginView: View {
    @State private var showForgotPassword = false
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: LoginViewModel
     
    init(appState: AppState) {
        self.viewModel = LoginViewModel(appState: appState)
    }
    
    var body: some View {
        ZStack {

            VStack {
               
                
                TextField("Email", text: $viewModel.email)
                
                SecureField("Contraseña", text: $viewModel.password)
                
                Button("¿Olvidó su contraseña?") {
                    showForgotPassword = true
                }
                
                Button(action: viewModel.login) {
                    Text("Iniciar")
                }
                
                Button("Regístrate") {
                    appState.currentView = .registerEmail
                }
                 
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(appState: AppState()).environmentObject(AppState())
    }
}

