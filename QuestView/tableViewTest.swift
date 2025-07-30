import Foundation
import UIKit

class FruitListViewController: UITableViewController {
    let fruits = ["사과", "바나나", "오렌지", "바나나"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "과일 리스트"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
}
