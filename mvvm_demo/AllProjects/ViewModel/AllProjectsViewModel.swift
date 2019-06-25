//
//  AllProjectsViewModel.swift
//  mvvm_demo
//
//  Created by Peter Bassem on 6/23/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import Foundation

protocol AllProjectsViewModelDelegate {
    func setViewTitle(title: String)
    func didStartFetchingProjects()
    func didFinishFetchingProjectsWithSuccess(with projectModel: ProjectsModel)
    func didFinishFetchingProjectsWithFailure(with error: Error)
    func dismissLoadingView()
}

class AllProjectsViewModel {
    
    let productImage: String?
    let productName: String?
    let productConcurrency: String?
    
    var delegate: AllProjectsViewModelDelegate?
    
    init(delegate: AllProjectsViewModelDelegate) {
        self.delegate = delegate
        self.productName = nil
        self.productImage = nil
        self.productConcurrency = nil
    }
    
    init(project: Projects) {
        self.productImage = project.project_img
        self.productName = project.project_name
        self.productConcurrency = project.project_concurency
    }
    
    func setNavigationTitle(title: String) {
        delegate?.setViewTitle(title: title)
    }
    
    func fetchProjects() {
        delegate?.didStartFetchingProjects()
        let futureProjects = AllProjectsAPIClient.getProjects()
        futureProjects.execute(onSuccess: { (projects) in
            self.delegate?.didFinishFetchingProjectsWithSuccess(with: projects)
        }) { (error) in
            self.delegate?.didFinishFetchingProjectsWithFailure(with: error)
        }
        delegate?.dismissLoadingView()
    }
}
