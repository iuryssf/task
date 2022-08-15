//
//  ToDoCell.swift
//  ToDoTasks
//
//  Created by Iury Faria on 26/07/22.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    static let reuseID = "ToDo Cell"
    let toDoTitle = ToDoTitleLabel(textAlignment: .left, fontSize: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(task: Task) {
        toDoTitle.text = task.title
    }
    
    private func configure() {
        addSubview(toDoTitle)
        
        NSLayoutConstraint.activate([
            toDoTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            toDoTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            toDoTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            toDoTitle.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
 
