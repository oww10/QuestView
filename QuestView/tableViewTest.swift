import Foundation
import UIKit

class FruitListViewController: UITableViewController {
    let fruits = ["사과", "바나나", "오렌지", "바나나"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "과일 리스트"
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        //        cell.textLabel?.text = fruits[indexPath.row]
        //        return cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLable.text = fruits[indexPath.row + 1]
        cell.subtitleLable.text = "subtitle"
        cell.iconImageView.image = UIImage(systemName: "star")
        
        
        return cell
    }
    
}

class iphoneListViewController: UITableViewController {
    let iphones = ["아이폰 12", "아이폰 11", "아이폰 XS", "아이폰 XR"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "아이폰 리스트"
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iphones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = iphones[indexPath.row]
        return cell
    }
    
}

class addOrRemoveViewController: UITableViewController {
    var items = ["사과", "바나나", "오렌지"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "과일 리스트"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @objc func addItem() {
        let newItem = "새 항목 \(items.count + 1)"
        items.append(newItem)
        
        let newIndexPath = IndexPath(row: items.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func updateItem(at index:Int, with newValue: String){
        items[index] = newValue
        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "항목 수정",
                                      message: "새로운 값을 입력하세요.",
                                      preferredStyle: .alert)
        
        alert.addTextField { textField in
            
            textField.text = self.items[indexPath.row]
        }
        
        
        let updateAction = UIAlertAction(title: "수정", style: .default) { [weak self] _ in
            if let textField = alert.textFields?.first, let newValue = textField.text {
                
                self?.updateItem(at: indexPath.row, with: newValue)
            }
        }
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
