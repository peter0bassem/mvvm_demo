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
    
    let projectsViewModel = AllProjectsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "All Projects"
        
        projectsViewModel.delegate = self
        
        setupProjectsTableView()
        fetchAllProjects()
    }
    
    func fetchAllProjects() {
        projectsViewModel.fetchProjects()
    }
}

extension AllProjectsViewController: AllProjectsViewModelDelegate {
    
    func didStartFetchingProjects() {
        ActivityIndicatorManager.shared.showProgressView()
    }
    
    func didFinishFetchingProjectsWithSuccess(with projectModel: ProjectsModel) {
        self.projectViewModels = projectModel.projects?.map({ return AllProjectsViewModel(project: $0) }) ?? []
        self.projectsTableView.reloadData()
    }
    
    func didFinishFetchingProjectsWithFailure(with error: Error) {
        print(error.localizedDescription)
    }
    
    func dismissLoadingView() {
        ActivityIndicatorManager.shared.hideProgressView()
    }
}
