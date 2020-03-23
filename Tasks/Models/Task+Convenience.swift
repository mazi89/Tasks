//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Ben Gohlke on 3/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    @discardableResult convenience init(identifier: UUID = UUID(),
                     name: String,
                     notes: String? = nil,
                     complete: Bool = false,
                     context: NSManagedObjectContext) {
        self.init(context: context)
        self.identifier = identifier
        self.name = name
        self.notes = notes
        self.complete = complete
    }
}
