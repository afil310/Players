//
//  PlayerCell.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var collegeLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var yearsInLeagueLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    var numberLabel: UILabel!
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    // MARK: - Cell setup
    func setupCell() {
        let backgroundView = UIView()
        
        backgroundView.backgroundColor = Table.cellBackgroundColor
        backgroundView.layer.cornerRadius = 10
        
        selectedBackgroundView = backgroundView
        
        let numberView = UIView()
        numberView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(numberView)
        numberView.backgroundColor = NumberView.color
        NSLayoutConstraint.activate([numberView.heightAnchor.constraint(equalTo: numberView.widthAnchor),
                                     numberView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     numberView.heightAnchor.constraint(equalToConstant: NumberView.size),
                                     numberView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        layoutSubviews()
        numberView.layer.cornerRadius = numberView.bounds.height / 2
        numberView.layer.borderWidth = NumberView.borderWidth
        numberView.layer.borderColor = UIColor.white.cgColor
        numberLabel = UILabel()
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberView.addSubview(numberLabel)
        NSLayoutConstraint.activate([numberLabel.centerYAnchor.constraint(equalTo: numberView.centerYAnchor),
                                     numberLabel.centerXAnchor.constraint(equalTo: numberView.centerXAnchor)
            ])
    }
}
