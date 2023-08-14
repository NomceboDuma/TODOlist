//
//  TODOlistApp.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/11.
//

import SwiftUI

@main
struct TODOlistApp: App {
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            launchScreenController()
                .environment(\.managedObjectContext,persistenceController.container.viewContext)
        }
    }
}
