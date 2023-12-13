//
//  ForgotPasswordView.swift
//  WeightController
//
//  Created by Markel Juaristi on 13/12/23.
//


import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var viewModel = ForgotPasswordViewModel()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: AppState

    
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                HStack{
                    BackButton(destination: .login)
                        .environmentObject(appState)
                    
                    Spacer()
                }
                Spacer()
                
                
                Text("Restablecer contraseña")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                
                Text("Introduce tu correo electrónico y te enviaremos instrucciones para restablecer tu contraseña.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                
                TextField("Correo electrónico", text: $viewModel.email)
                    .inputFieldStyle()
                
                
                Button(action: viewModel.resetPassword) {
                    Text("Enviar")
                }
                .brightOrangeButton()
                .padding(.top, 50)
                
                if !viewModel.message.isEmpty {
                    Text(viewModel.message)
                        .foregroundColor(viewModel.isError ? .red : .green)
                        .padding()
                }
                
                
                Button("Volver al login") {
                    presentationMode.wrappedValue.dismiss()
                }
                .vibrantVioletButton()
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.all)
    }
}



struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
