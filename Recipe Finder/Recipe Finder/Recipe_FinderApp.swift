//
//  Recipe_FinderApp.swift
//  Recipe Finder
//
//  Created by Nathan Geronimo on 7/15/24.
//

import SwiftUI

@main
struct Recipe_FinderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
