//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Ben Gohlke on 3/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String, CaseIterable {
    case low
    case normal
    case high
    case critical
}

extension Task {
    
    var taskRepresentation: TaskRepresentation? {
        guard let name = name,
            let priority = priority else { return nil }
        
        return TaskRepresentation(identifier: identifier?.uuidString,
                                  name: name,
                                  notes: notes,
                                  priority: priority,
                                  complete: complete)
    }
    
    @discardableResult convenience init(identifier: UUID = UUID(),
                     name: String,
                     notes: String? = nil,
                     complete: Bool = false,
                     priority: TaskPriority = .normal,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.identifier = identifier
        self.name = name
        self.notes = notes
        self.complete = complete
        self.priority = priority.rawValue
    }
    
    @discardableResult convenience init?(taskRepresentation: TaskRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        guard let priority = TaskPriority(rawValue: taskRepresentation.priority),
            let identifierString = taskRepresentation.identifier,
            let identifier = UUID(uuidString: identifierString) else {
                return nil
        }
        
        self.init(identifier: identifier,
                  name: taskRepresentation.name,
                  notes: taskRepresentation.notes,
                  complete: taskRepresentation.complete ?? false,
                  priority: priority,
                  context: context)
    }
}
