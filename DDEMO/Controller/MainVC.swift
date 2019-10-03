import UIKit
import Foundation


class MainVC: UITableViewController {
    // hello
    var items = [Item]()
    var title_text: String? = "User Name"
    @IBOutlet var userNameTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTitle.title = title_text
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 80
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "delete") { (action, indexpath) in
            self.items.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            print("delete!!")
        }
        delete.backgroundColor = UIColor.red
    
        return [delete]
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemCell {
            cell.updateUI(item: items[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }


    @IBAction func addItem(_ sender: Any) {
        popUpAlert(itemText: nil, indexPath: nil)
    }
    
    func popUpAlert(itemText: String?, indexPath: IndexPath?) {
        
        let alert = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "enter something"
            
        })
        let confirmed = UIAlertAction(title: "Save", style: .default) { (action) -> Void in
            if let itemTextField = alert.textFields?.first?.text {
                print("\(itemTextField)")
                self.items.append(Item(itemName: itemTextField))
                print(self.items)
                self.tableView.reloadData()
            } else {
                print("fuck")
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("cancel")
        }
        
        alert.addAction(confirmed)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
