//
//  ActivityIndicator.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import UIKit

class ActivityIndicator: UIActivityIndicatorView {
    // MARK: - Properties
    var containerView: UIView?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(view: UIView) {
        self.init(frame: view.frame)
        containerView = view
        setup()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup
    func setup() {
        guard let view = containerView else {return}
        style = .whiteLarge
        color = .black
        hidesWhenStopped = true
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}
