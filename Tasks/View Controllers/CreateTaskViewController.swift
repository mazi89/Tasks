//
//  CreateTaskViewController.swift
//  Tasks
//
//  Created by Ben Gohlke on 3/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class CreateTaskViewController: UIViewController {
    
    // MARK: - Properties
    
    var complete = false
    var taskController: TaskController?
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var priorityControl: UISegmentedControl!
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Puts the cursor in the textfield and makes the keyboard appear
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text,
            !name.isEmpty else {
                return
        }
        
        let notes = notesTextView.text
        let priorityIndex = priorityControl.selectedSegmentIndex
        let priority = TaskPriority.allCases[priorityIndex]
        let task = Task(name: name, notes: notes, complete: complete, priority: priority, context: CoreDataStack.shared.mainContext)
        taskController?.sendTaskToServer(task: task)
        do {
            try CoreDataStack.shared.save()
            navigationController?.dismiss(animated: true, completion: nil)
        } catch {
            NSLog("Error saving managed object context: \(error)")
        }
    }
    
    @IBAction func toggleComplete(_ sender: UIButton) {
        complete.toggle()
        sender.setImage(complete ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle"), for: .normal)
    }
}

