//
//  WeightModel+CoreData.swift
//  WeightController
//
//  Created by Markel Juaristi on 19/12/23.
//

import Foundation
import CoreData

@objc(WeightKG)
public class WeightKG: NSManagedObject {
    @NSManaged public var date: Date
    @NSManaged public var weight: Double
}
