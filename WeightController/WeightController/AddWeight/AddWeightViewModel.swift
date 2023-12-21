//
//  AddWeightViewModel.swift
//  WeightController
//
//  Created by Markel Juaristi on 21/12/23.
//

import Foundation
import CoreData

class WeightViewModel: ObservableObject {
    private var manager = CoreDataManager.shared
    
    func addWeightRecord(weight: Double, date: Date, overwrite: Bool = false) {
        if !overwrite && recordExists(for: date) {
            // Manejar la situación de registro duplicado (puede ser mediante un callback o una notificación)
            return
        }
        
        manager.saveWeight(for: date, weight: weight)
    }

    func recordExists(for date: Date) -> Bool {
        return manager.getWeight(for: date) != nil
    }
}
