//
//  TaskController.swift
//  Tasks
//
//  Created by Ben Gohlke on 3/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

let baseURL = URL(string: "https://tasks-3f211.firebaseio.com/")!

class TaskController {
    
    typealias CompletionHandler = (Error?) -> Void
    
    init() {
        fetchTasksFromServer()
    }
    
    func fetchTasksFromServer(completion: @escaping CompletionHandler = { _ in }) {
        let requestURL = baseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { data, _, error in
            if let error = error {
                NSLog("Error fetching tasks: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned by data task")
                completion(NSError())
                return
            }
            
            do {
                let taskRepresentations = Array(try JSONDecoder().decode([String : TaskRepresentation].self, from: data).values)
                try self.updateTasks(with: taskRepresentations)
            } catch {
                
            }
        }
    }
    
    private func updateTasks(with representations: [TaskRepresentation]) throws {
        let tasksByID = representations.filter { $0.identifier != nil }
    }
}
