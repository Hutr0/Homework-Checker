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
    
    var model: DataModel!
    var homeworkModel: Array<Homework> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homeworkModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.set(homeworkModel[indexPath.row])

        return cell
    }
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let addVC = segue.source as? AddController else { return }
        
        homeworkModel.append(addVC.save())
        tableView.reloadData()
    }

}
