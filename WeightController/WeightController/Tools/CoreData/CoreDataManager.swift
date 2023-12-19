//
//  CoreDataManager.swift
//  WeightController
//
//  Created by Markel Juaristi on 19/12/23.
//
import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeightKGModel") // Asegúrate de que este nombre coincida con el de tu archivo .xcdatamodeld
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - WeightKG Management
    func saveWeight(for date: Date, weight: Double) {
        let weightRecord = WeightKG(context: context)
        weightRecord.date = date
        weightRecord.weight = weight
        saveContext()
    }

    func getWeight(for date: Date) -> WeightKG? {
        let fetchRequest: NSFetchRequest<WeightKG> = WeightKG.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", date as CVarArg)

        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch {
            print("Error fetching weight for date: \(error)")
            return nil
        }
    }

}
