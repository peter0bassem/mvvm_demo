//
//  allProjectsEndPoint.swift
//  mvvm_demo
//
//  Created by Peter Bassem on 6/23/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import Foundation
import Alamofire

enum AllProjectsEndPoint: APIConfiguration {
    
    case getAllProjects
    
    //MARK: - HTTP Method
    internal var method: HTTPMethod {
        switch self {
        case .getAllProjects:
            return .get
        }
    }
    
    //MARK: - Path
    internal var path: String {
        switch self {
        case .getAllProjects:
            return "allprojects"
        }
    }
    
    //MARK: - Parameters
    internal var parameters: Parameters? {
        switch self {
        case .getAllProjects:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.method = method
        
        urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(K.ContentType.json.rawValue, forHTTPHeaderField: K.HTTPHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
