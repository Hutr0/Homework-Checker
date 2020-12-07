//
//  dataModel.swift
//  Homework checker
//
//  Created by Леонид Лукашевич on 05.12.2020.
//

import UIKit

struct Homework {
    var name: String
    var lesson: String
    var description: String
    var priority: String
    var date: Date
    
    init(name: String, lesson: String, description: String, priority: String, date: Date) {
        self.name = name
        self.lesson = lesson
        self.description = description
        self.priority = priority
        self.date = date
    }
}
