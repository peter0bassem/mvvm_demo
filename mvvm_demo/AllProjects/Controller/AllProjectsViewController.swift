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
    
    lazy var projectsViewModel: AllProjectsViewModel = {
       let viewModel = AllProjectsViewModel(delegate: self)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        projectsViewModel.setNavigationTitle(title: "Test title")
        
        setupProjectsTableView()
        fetchAllProjects()
    }
    
    func fetchAllProjects() {
        DispatchQueue.global().async {
            self.projectsViewModel.fetchProjects()
        }
    }
}

extension AllProjectsViewController: AllProjectsViewModelDelegate {
    
    func setViewTitle(title: String) {
        navigationItem.title = title
    }
    
    func didStartFetchingProjects() {
        ActivityIndicatorManager.shared.showProgressView()
    }
    
    func didFinishFetchingProjectsWithSuccess(with projectModel: ProjectsModel) {
        DispatchQueue.main.async {
            self.projectViewModels = projectModel.projects?.map({ return AllProjectsViewModel(project: $0) }) ?? []
            self.projectsTableView.reloadData()
        }
    }
    
    func didFinishFetchingProjectsWithFailure(with error: Error) {
        DispatchQueue.main.async {
            print(error.localizedDescription)
        }
    }
    
    func dismissLoadingView() {
        ActivityIndicatorManager.shared.hideProgressView()
    }
}
