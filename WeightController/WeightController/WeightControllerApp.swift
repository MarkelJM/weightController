//
//  WeightControllerApp.swift
//  WeightController
//
//  Created by Markel Juaristi on 11/12/23.
//

import SwiftUI

@main
struct WeightControllerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
