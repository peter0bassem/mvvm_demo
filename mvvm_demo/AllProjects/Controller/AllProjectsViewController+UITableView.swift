//
//  AllProjectsViewController+UITableView.swift
//  mvvm_demo
//
//  Created by Peter Bassem on 6/23/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import Foundation
import UIKit

extension AllProjectsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupProjectsTableView() {
        projectsTableView.dataSource = self
        projectsTableView.delegate = self
        projectsTableView.registerCell(cell: ProjectTableViewCell.self)
        projectsTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = projectsTableView.dequeue(at: indexPath) as ProjectTableViewCell
        let projectViewModel = projectViewModels[indexPath.row]
        cell.project = projectViewModel
        return cell
    }
}

extension UITableView {
    
    func registerCell<Cell: UITableViewCell>(cell: Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UITableViewCell>(at indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue table view cell")
        }
        return cell
    }
}
