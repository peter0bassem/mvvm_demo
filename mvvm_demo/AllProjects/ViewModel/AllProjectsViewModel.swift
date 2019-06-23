//
//  AllProjectsViewModel.swift
//  mvvm_demo
//
//  Created by Peter Bassem on 6/23/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import Foundation

class AllProjectsViewModel {
    
    let productImage: String?
    let productName: String?
    let productConcurrency: String?
    
    init(project: Projects) {
        self.productImage = project.project_img
        self.productName = project.project_name
        self.productConcurrency = project.project_concurency
    }
}
