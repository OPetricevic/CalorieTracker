//
//  DataController.swift
//  CalorieTracker
//
//  Created by Omar Petričević on 02.11.2023..
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved!!!")
        } catch {
            print("We could not save the data...")
        }
    }
    func addFood(name: String, calories: Double, context: NSManagedObjectContext){
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext){
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
}
