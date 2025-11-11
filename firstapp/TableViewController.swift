//
//  TableViewController.swift
//  firstapp
//
//  Created by Диас Акберген on 10.11.2025.
//

import UIKit

extension TableViewController: GoalUpdateDelegate {
    func didUpdateGoal(_ goal: Goal, at index: Int) {
        goals[index] = goal
        saveGoals()
        tableView.reloadData()
    }
}
protocol GoalUpdateDelegate: AnyObject {
    func didUpdateGoal(_ goal: Goal, at index: Int)
}

class TableViewController: UITableViewController {
    
    var goals: [Goal] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGoal))
        
        view.backgroundColor = .systemBackground
        title = "Big Purchase Calculator"
        loadGoals()
        if goals.isEmpty {
            let defaultGoal = Goal(name: "My Goal", targetPrice: 0, currentSavings: 0, monthlySaving: 0)
            goals.append(defaultGoal)
            saveGoals()
        }
    }

    // MARK: - Table view data source
    func loadGoals() {
        if let data = UserDefaults.standard.data(forKey: "goals"),
           let decoded = try? JSONDecoder().decode([Goal].self, from: data) {
            goals = decoded
        }
    }
    
    func saveGoals() {
        if let data = try? JSONEncoder().encode(goals) {
            UserDefaults.standard.set(data, forKey: "goals")
        }
    }
    
    @objc func addGoal() {
        let newGoal = Goal(name: "New Goal", targetPrice: 0, currentSavings: 0, monthlySaving: 0)
        goals.append(newGoal)
        saveGoals()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return goals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")

        // Configure the cell...
        let goal = goals[indexPath.row]
        cell.textLabel?.text = goal.name

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ViewController()
        viewController.goalIndex = indexPath.row
        viewController.delegate = self
        viewController.goal = goals[indexPath.row]
        navigationController?.show(viewController, sender: self)
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
