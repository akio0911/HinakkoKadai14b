//
//  ItemsTableViewController.swift
//  HinakkoKadai14
//
//  Created by Hina on 2023/07/12.
//

import UIKit

class ItemsTableViewController: UITableViewController {


        let KeyName = "Name"
        let KeyCheck = "Check"

        var items: [Dictionary<String,Any>] = []

        override func viewDidLoad() {
            super.viewDidLoad()

            self.items = [
                [KeyName:"りんご", KeyCheck:false],
                [KeyName:"みかん", KeyCheck:true],
                [KeyName:"バナナ", KeyCheck:false],
                [KeyName:"パイナップル", KeyCheck:true]
            ]
        }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! ItemTableViewCell

        let item = items[indexPath.row]

        cell.checkImageView.image = nil
        if item[KeyCheck] as? Bool == true {
            cell.checkImageView.image = UIImage(named: "checkMark")
        }

        cell.nameLabel.text = (item[KeyName] as? String) ?? ""

        return cell
    }

    @IBAction func exitFromAddByCancel(segue:UIStoryboardSegue) {

    }

    @IBAction func exitFromAddBySave(segue:UIStoryboardSegue) {
        if let add = segue.source as? AddItemViewController {
            let item:Dictionary<String,Any> = [KeyName:add.nameTextField.text as Any, KeyCheck:false]
            self.items.append(item)
            self.tableView.reloadData()
        }
    }
}
