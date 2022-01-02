//
//  TableViewController.swift
//  Composite
//
//  Created by Артур Дохно on 02.01.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var currentFolder: Compose = Folder(name: "Main")
    
    private var tableVitwController: TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController
        return viewController!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addFileBarButton(_ sender: Any) {
        currentFolder.addComponent(component: File(name: "New file"))
        tableView.reloadData()
    }
    
    @IBAction func addFolderBarButton(_ sender: Any) {
        currentFolder.addComponent(component: Folder(name: "New folder"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentFolder.contentCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        guard let contents = currentFolder.showContent() as? [Compose] else { fatalError() }
        
        let item = contents[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item is Folder ? "Folder" : "File"
        cell.imageView?.image = item is Folder ? UIImage(named: "Folder") : UIImage(named: "File")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contents = currentFolder.showContent() as? [Compose] else { fatalError() }
        
        let item = contents[indexPath.row]
        
        tableVitwController.currentFolder = item
        
        item is Folder ? showFolder() : print(item)
    }
    
    func showFolder() {
        navigationController?.pushViewController(tableVitwController, animated: true)
    }

}
