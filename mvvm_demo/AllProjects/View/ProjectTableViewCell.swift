//
//  ProjectTableViewCell.swift
//  mvvm_demo
//
//  Created by Peter Bassem on 6/23/19.
//  Copyright © 2019 Peter Bassem. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var startingPriceLabel: UILabel!
    
    var project: AllProjectsViewModel! {
        didSet {
            guard let projectImage = project.productImage, let projectImageURL = URL(string: projectImage) else { return }
            projectImageView.kf.setImage(with: projectImageURL)
            projectNameLabel.text = project.productName
            startingPriceLabel.text = project.productConcurrency
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        projectImageView.contentMode = .scaleAspectFill
        setupActivityIndicator(projectActivityIndicator)
        startActivityIndicator(projectActivityIndicator)
    }
}

extension UITableViewCell {
    func setupActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.color = .red
        activityIndicator.isHidden = false
    }
    
    func startActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}
