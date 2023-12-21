//
//  AddWeightView.swift
//  WeightController
//
//  Created by Markel Juaristi on 21/12/23.
//

import SwiftUI

struct AddWeightView: View {
    @StateObject var viewModel = WeightViewModel()
    @State var weight: String = ""
    @State var selectedDate: Date = Date()
    @State var showingDatePicker = false
    @State var showingAlert = false

    var body: some View {
        VStack {
            TextField("Peso", text: $weight)
                .keyboardType(.decimalPad)
            
            Button("Hoy") {
                saveWeight(date: Date())
            }
            
            Button("Otro día") {
                showingDatePicker = true
            }
            
            if showingDatePicker {
                DatePicker("Seleccionar fecha", selection: $selectedDate, displayedComponents: .date)
                Button("Guardar") {
                    saveWeight(date: selectedDate)
                    showingDatePicker = false
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Peso ya registrado"),
                message: Text("Ya existe un registro para esta fecha. ¿Quieres sobrescribirlo?"),
                primaryButton: .destructive(Text("Sobrescribir")) {
                    saveWeight(date: selectedDate, overwrite: true)
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    private func saveWeight(date: Date, overwrite: Bool = false) {
        guard let weightDouble = Double(weight) else { return }
        if viewModel.recordExists(for: date) && !overwrite {
            showingAlert = true
        } else {
            viewModel.addWeightRecord(weight: weightDouble, date: date, overwrite: overwrite)
        }
    }
}

struct AddWeightView_Previews: PreviewProvider {
    static var previews: some View {
        AddWeightView()
    }
}

