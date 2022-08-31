//
//  ZooApp.swift
//  Zoo
//
//  Created by Phantom on 13/6/2022.
//

import SwiftUI

@main
struct ZooApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
