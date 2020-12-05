//
//  TableViewCell.swift
//  Homework checker
//
//  Created by Леонид Лукашевич on 05.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lessonLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func set(_ homework: Homework) {
        
        self.nameLabel.text = homework.name
        self.lessonLabel.text = homework.lesson
        self.descriptLabel.text = homework.description
        self.priorityLabel.text = homework.priority
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        self.dateLabel.text = dateFormatter.string(from: homework.date)
    }
}
