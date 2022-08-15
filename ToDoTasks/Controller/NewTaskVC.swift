//
//  NewTaskVC.swift
//  ToDoTasks
//
//  Created by Iury Faria on 26/07/22.
//

import UIKit

protocol CreateTaskDelegate {
    func createTask(task: Task)
}

class NewTaskVC: UIViewController {
    
    var delegate: CreateTaskDelegate?
    
    var taskField = UITextField()
    var createTaskButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
        configureTextField()
        configureButton()
        configureViewController()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissVC))
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    
    @objc func saveTask() {
        guard let task = taskField.text, !taskField.text!.isEmpty else {
            return
        }        
        let newTask = Task(title: task)
        delegate?.createTask(task: newTask)
    }
    
    func layoutUI() {
        view.addSubview(taskField)
        view.addSubview(createTaskButton)
        
        taskField.translatesAutoresizingMaskIntoConstraints = false
        createTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            taskField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            taskField.heightAnchor.constraint(equalToConstant: 50),
            
            createTaskButton.topAnchor.constraint(equalTo: taskField.bottomAnchor, constant: 20),
            createTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createTaskButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configureTextField() {
        let field = taskField
        
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor.systemGray4.cgColor
        field.textAlignment = .center
        field.becomeFirstResponder()
        
        field.placeholder = "Enter a new task"
        
    }
    
    
    func configureButton() {
        let button = createTaskButton
        
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Create Task", for: .normal)
        button.backgroundColor = .systemMint
    }
    
    
}
