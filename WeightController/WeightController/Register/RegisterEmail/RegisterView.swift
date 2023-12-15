//
//  RegisterView.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Repetir Contraseña", text: $viewModel.repeatPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            Button("Registrar") {
                viewModel.register()
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.showVerificationSheet) {
            VerificationSheetView(isEmailVerified: $viewModel.isEmailVerified, checkEmailVerification: viewModel.checkEmailVerification)
        }
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

