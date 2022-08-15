//
//  ToDoVC.swift
//  ToDoTasks
//
//  Created by Iury Faria on 26/07/22.
//

import UIKit

class ToDoVC: UIViewController {
    
    var tableView = UITableView()
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        let destVC = NewTaskVC()
        destVC.delegate = self
        destVC.title = "New Task"
        let navController = UINavigationController(rootViewController: destVC)
        
        present(navController, animated: true)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ToDoCell.self, forCellReuseIdentifier: ToDoCell.reuseID)
    }
    
}

extension ToDoVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.reuseID) as! ToDoCell
        let task = tasks[indexPath.row]
        cell.set(task: task)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

extension ToDoVC: CreateTaskDelegate {
    
    func createTask(task: Task) {
        self.dismiss(animated: true) {
            self.tasks.append(task)
            self.tableView.reloadData()
        }
    }
}
