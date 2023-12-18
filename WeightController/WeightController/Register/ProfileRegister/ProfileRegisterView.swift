//
//  ProfileRegisterView.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

import SwiftUI

struct ProfileRegisterView: View {
    @ObservedObject var viewModel = ProfileRegisterViewModel()
    @State private var isImagePickerPresented = false

    var body: some View {
        VStack {
            TextField("Nombre", text: $viewModel.firstName)
            TextField("Apellido", text: $viewModel.lastName)
            // ... otros campos de texto

            if let image = viewModel.profileImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }

            Button("Seleccionar Imagen") {
                isImagePickerPresented = true
            }

            Button("Registrar Perfil") {
                viewModel.registerProfile()
            }

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage).foregroundColor(.red)
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $viewModel.profileImage)
        }
    }
}


struct ProfileRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRegisterView()
    }
}
