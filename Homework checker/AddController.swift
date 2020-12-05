//
//  AddController.swift
//  Homework checker
//
//  Created by Леонид Лукашевич on 05.12.2020.
//

import UIKit

class AddController: UITableViewController {
    
    var homeworkModel: Homework?

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lesson: UIPickerView!
    @IBOutlet weak var descript: UITextView!
    @IBOutlet weak var priority: UISegmentedControl!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        doneButton.isEnabled = false
        name.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func save() -> Homework{
        
        return Homework.init(name: name.text ?? "", lesson: lesson.description, description: descript.text, priority: priority.titleForSegment(at: priority.selectedSegmentIndex) ?? "1", date: date.date)
    }
    
}

// MARK: - Text Field Delegate

extension AddController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldChanged() {
        if name.text?.isEmpty == false {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
}
