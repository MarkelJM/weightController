//
//  WeightModel+CoreDataProperties.swift
//  WeightController
//
//  Created by Markel Juaristi on 19/12/23.
//

import Foundation
import CoreData

extension WeightKG {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeightKG> {
        return NSFetchRequest<WeightKG>(entityName: "WeightKG")
    }
}

extension WeightKG: Identifiable {
    public var id: Date {
        return date
    }
}
