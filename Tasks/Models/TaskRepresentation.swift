//
//  TaskRepresentation.swift
//  Tasks
//
//  Created by Ben Gohlke on 3/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct TaskRepresentation: Codable {
    var identifier: String?
    var name: String
    var notes: String?
    var priority: String
    var complete: Bool?
}
