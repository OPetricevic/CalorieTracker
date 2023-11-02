//
//  CalorieTrackerApp.swift
//  CalorieTracker
//
//  Created by Omar Petričević on 02.11.2023..
//

import SwiftUI

@main
struct CalorieTrackerApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
