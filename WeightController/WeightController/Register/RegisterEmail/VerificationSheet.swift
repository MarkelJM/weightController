//
//  VerificationSheet.swift
//  WeightController
//
//  Created by Markel Juaristi on 15/12/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct VerificationSheetView: View {
    @Binding var isEmailVerified: Bool
    var checkEmailVerification: () -> Void
    
    var body: some View {
        VStack {
            Text("Por favor, verifica tu email.")
            
            if isEmailVerified {
                Text("¡Email verificado!")
            } else {
                Button("Comprobar Verificación") {
                    checkEmailVerification()
                }
                .padding()
            }
        }
        .padding()
    }
}
