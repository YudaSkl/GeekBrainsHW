//
//  GlobalGroupsTableViewController.swift
//  l1_Sklyarov
//
//  Created by Valeriy Sklyarov on 15.04.2021.
//

import UIKit

class GlobalGroupsTableViewController: UITableViewController {
    let groupsCellID = "GroupsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: groupsCellID, bundle: nil), forCellReuseIdentifier: groupsCellID)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let count = DataStorage.shared.groups.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupsCellID, for: indexPath) as! GroupsTableViewCell
        let currGroup = DataStorage.shared.groups[indexPath.row]
        if currUserContains(group: currGroup){
            cell.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }
        else{
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        cell.configure(title: currGroup.name, img: currGroup.img)
        return cell
    }
    func currUserContains(group: Group) -> Bool{
        for groupElem in DataStorage.shared.currUser.groups{
            if groupElem.isEqual(group: group){
                return true
            }
        }
        return false
    }
    private func handleMarkAsAdd(group: Group) {
        if !currUserContains(group: group){
        DataStorage.shared.currUser.addGroup(group: group)
        self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let currGroup = DataStorage.shared.groups[indexPath.row]
        let action = UIContextualAction(style: .destructive,
                                        title: "Add") { [weak self] (action, view, completionHandler) in
            self?.handleMarkAsAdd(group: currGroup)
            completionHandler(true)
        }
        action.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        action.image = UIImage(systemName: "checkmark.seal.fill")!
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
