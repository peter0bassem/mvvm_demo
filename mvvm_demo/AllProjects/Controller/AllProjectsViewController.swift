//
//  ViewController.swift
//  mvvm_demo
//
//  Created by Peter Bassem on 6/23/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import UIKit

class AllProjectsViewController: UIViewController {
    
    @IBOutlet weak var projectsTableView: UITableView!
    
    var projectViewModels = [AllProjectsViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "All Projects"
        
        setupProjectsTableView()
        fetchAllProjects()
    }
    
//    func fetchAllProjects() {
//        let futureProjects = AllProjectsAPIClient.getProjects()
//        futureProjects.execute(onSuccess: { (projects) in
//            self.projectViewModels = projects.projects?.map({ return AllProjectsViewModel(project: $0) }) ?? []
//            self.projectsTableView.reloadData()
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//    }
}

