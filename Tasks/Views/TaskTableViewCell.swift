//
//  TaskTableViewCell.swift
//  Tasks
//
//  Created by Ben Gohlke on 3/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    // MARK: - Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Private

    private func updateViews() {
        guard let task = task else { return }
        
        taskTitleLabel.text = task.name
        completedButton.setImage(task.complete ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle"), for: .normal)
    }
}
