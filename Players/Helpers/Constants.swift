//
//  Constants.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import UIKit

// MARK: - Table parameters
/// Global constants for UITableView.
struct Table {
    static let title = "Players"
    static let cellId = "playerCell"
    static let cellBackgroundColor = UIColor(red: 0.5647, green: 0.8196, blue: 0.9765, alpha: 1.0) /* #90d1f9 */
    static let listItemColor = UIColor(red: 0.87, green: 0.95, blue: 0.99, alpha: 1.0) //#ddf1fe
}

// MARK: - Rounded Number view parameters
/// Global constants for the rounded Number view.
struct NumberView {
    static let color = UIColor(red: 0.7961, green: 0.9765, blue: 0.7216, alpha: 1.0) /* #cbf9b8 */
    static let size = CGFloat(44)
    static let borderWidth = CGFloat(4)
}

// MARK: - Data source parameters
/// Global constants for Data source object.
struct DataSource {
    static let savedValuesKey = "savedValues"
    static let fileName = "players_sample"
    static let fileType = "csv"
}

// MARK: - Web view parameters
/// Global constants for Web view.
struct Web {
    static let searchUrl = "https://www.basketball-reference.com/search/search.fcgi?search="
}
