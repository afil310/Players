//
//  TableDataSource.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import UIKit

class TableDataSource: NSObject {
    
    // MARK: - Properties
    var players = [Player]()
    let positionDict = ["PF": "Power Forward",
                        "SG": "Shooting Guard",
                        "SF": "Small Forward",
                        "C": "Center",
                        "PG": "Power Guard",
                        "G": "Guard"
    ]

    // MARK: - Initializers
    override init() {
        super.init()
        players = CSVReader.loadRecords(fileName: DataSource.fileName, fileType: DataSource.fileType) ?? []
    }
    
    // MARK: -
    /// Sorts players by the specified property
    func sort(sortBy: String) {
        switch sortBy {
        case Picker.componentValues[0]: // Sort by number uses convertedNumber field
            players.sort {
                $0.convertedNumber < $1.convertedNumber
            }
        case Picker.componentValues[1]: // Sort by First name
            players.sort {
                $0.firstName < $1.firstName
            }
        case Picker.componentValues[2]: // Sort by First name
            players.sort {
                $0.lastName < $1.lastName
            }
        case Picker.componentValues[3]: // Sort by Position
            players.sort {
                $0.position < $1.position
            }
        case Picker.componentValues[4]: // Sort by DOB
            players.sort {
                $0.convertedDob < $1.convertedDob
            }
        case Picker.componentValues[5]: // Sort by country
            players.sort {
                $0.country < $1.country
            }
        case Picker.componentValues[6]: // Sort by years in league
            players.sort {
                $0.convertedYearsInLeague < $1.convertedYearsInLeague
            }
        case Picker.componentValues[7]: // Sort by college
            players.sort {
                $0.college < $1.college
            }
        default:
            return
        }
    }
}

// MARK: - UITableViewDataSource
extension TableDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count > 0 ? players.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Table.cellId) as? PlayerCell
            else {
                return UITableViewCell()
        }
        cell.cellView.layer.cornerRadius = 10
        cell.cellView.layer.backgroundColor = Table.listItemColor.cgColor
        cell.numberLabel.text = players[indexPath.row].number
        cell.fullNameLabel.text = players[indexPath.row].firstName + " " + players[indexPath.row].lastName
        cell.collegeLabel.text = players[indexPath.row].college
        cell.yearsInLeagueLabel.text = players[indexPath.row].yearsInLeague
        cell.dobLabel.text = players[indexPath.row].age + " (" + players[indexPath.row].dob + ")"
        cell.countryLabel.text = players[indexPath.row].country
        var position = ""
        if let positionName = positionDict[players[indexPath.row].position] {
            position = positionName + " (" + players[indexPath.row].position + ")"
        } else {
            position = players[indexPath.row].position
        }
        cell.positionLabel.text = position
        return cell
    }
}
