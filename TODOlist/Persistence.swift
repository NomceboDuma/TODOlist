//
//  Persistence.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/11.
//
//import Foundation

import CoreData

class PersistenceController {
    
    
    static let shared: PersistenceController = PersistenceController()
    
    let container: NSPersistentContainer
    
    private  init() {
        
        container = NSPersistentContainer(name: "ToDoListModel")
        
        container.loadPersistentStores { (storeDescription, error) in if let error = error as NSError? {
            fatalError("container load failed: \(error)")
        }
            
        }
    }
}
