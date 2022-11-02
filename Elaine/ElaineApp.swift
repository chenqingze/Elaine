//
//  ElaineApp.swift
//  Elaine
//
//  Created by ChenQingze on 2022/11/2.
//

import SwiftUI

@main
struct ElaineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
