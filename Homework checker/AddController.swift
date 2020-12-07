//
//  AddController.swift
//  Homework checker
//
//  Created by Леонид Лукашевич on 05.12.2020.
//

import UIKit

class AddController: UITableViewController {
    
    var homeworkModel: Homework?
    var lessons: Array<String> = ["Русаков", "Выжигин", "Лесько", "Философия"]

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lesson: UIPickerView!
    @IBOutlet weak var descript: UITextView!
    @IBOutlet weak var priority: UISegmentedControl!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var lessonPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        doneButton.isEnabled = false
        name.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        lessonPicker.delegate = self
    }
    
    func save() -> Homework{
        
        return Homework.init(name: name.text ?? "", lesson: lesson.description, description: descript.text, priority: priority.titleForSegment(at: priority.selectedSegmentIndex) ?? "", date: date.date)
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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

// MARK: - Picker View

extension AddController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lessons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        }
        
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.numberOfLines = 0
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = lessons[row]
        
        return pickerViewLabel
    }
}
