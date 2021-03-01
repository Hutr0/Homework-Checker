//
//  TableViewController.swift
//  Homework checker
//
//  Created by Леонид Лукашевич on 05.12.2020.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var context: NSManagedObjectContext!
    
    var homeworkModel: Array<Model> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
    }
    
    func getData() {
        
        let fetchRequest: NSFetchRequest<Model> = Model.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name != nil")
        
        do {
            let results = try context.fetch(fetchRequest)
            for result in results {
                homeworkModel.append(result)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            context.delete(homeworkModel[indexPath.row])
            do {
                try context.save()
                homeworkModel.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeworkModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        cell.set(homeworkModel[indexPath.row])

        return cell
    }
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let addVC = segue.source as? AddController else { return }
        
        let model = Model(context: context!)
        let arrayData = addVC.save()
        
        model.name = arrayData.name
        model.descript = arrayData.description
        model.priority = arrayData.priority
        model.date = arrayData.date
        model.lesson = arrayData.lesson
        
        do {
            try context!.save()
            homeworkModel.append(model)
            tableView.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

}
