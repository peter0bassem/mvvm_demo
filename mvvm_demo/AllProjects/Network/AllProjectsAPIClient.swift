//
//  AllProjectsAPIClient.swift
//  mvvm_demo
//
//  Created by Peter Bassem on 6/23/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import Foundation
import PromisedFuture

class AllProjectsAPIClient {
    
    static func getProjects() -> Future<ProjectsModel> {
        return APIClient.performRequest(route: AllProjectsEndPoint.getAllProjects)
    }
}
