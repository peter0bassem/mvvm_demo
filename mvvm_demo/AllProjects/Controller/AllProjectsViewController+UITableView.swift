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
