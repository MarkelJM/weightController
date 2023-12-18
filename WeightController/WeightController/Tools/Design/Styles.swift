//
//  Styles.swift
//  WeightController
//
//  Created by Markel Juaristi on 13/12/23.
//

import Foundation
import SwiftUI


extension Button where Label == Text {
    func buttonStyle() -> some View {
        self
            .padding()
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


extension Button where Label == Text {
    func brightOrangeButton() -> some View {
        self
            .buttonStyle()
            .background(Color.orange)
            .cornerRadius(10)
        
    }
    
    func deepOrangeButton() -> some View {
        self
            .buttonStyle()
            .background(Color.orange)
            .cornerRadius(10)
    }
    
    func vibrantVioletButton() -> some View {
        self
            .buttonStyle()
            .background(Color.black)
            .cornerRadius(10)
    }
}

extension Toggle where Label == Text {
    func toggleStyleCustom() -> some View {
        self
            .toggleStyle(SwitchToggleStyle(tint: Color.orange))
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

extension DatePicker {
    func datePickerStyleCustom() -> some View {
        self
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

extension TextField {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

extension View {
    func inputFieldStyle() -> some View {
        self
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
//flecha para volver atras.
struct BackButton: View {
    @EnvironmentObject var appState: AppState // Accede a appState desde el entorno
    var destination: AppState.AppView

    var body: some View {
        Button(action: {
            appState.currentView = destination
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.white) // Establecer el color del icono
                .padding(10) // Añadir algo de relleno alrededor del icono
                .background(Color.gray.opacity(0.5)) // Color de fondo (ajustable)
                .cornerRadius(8) // Esquinas redondeadas
                .overlay(
                    RoundedRectangle(cornerRadius: 8) // Crea un borde redondeado
                        .stroke(Color.white, lineWidth: 2) // Color y grosor del borde
                )
        }
    }
}

extension Text {
    func textStyle() -> some View {
        self
            .font(.whatTheFont(size: 18)) // Puedes cambiar la fuente y el tamaño según tus necesidades
            .foregroundColor(Color.black) // Cambia el color del texto si es necesario
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

extension Label where Title == Text, Icon == Image {
    func labelStyle() -> some View {
        self
            .font(.whatTheFont(size: 16))
            .foregroundColor(Color.black)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

extension View{
    func sectionStyle() -> some View {
        self
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
    }
}

