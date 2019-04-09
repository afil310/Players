//
//  ViewController.swift
//  Players
//
//  Created by Andrey Filonov on 08/04/2019.
//  Copyright © 2019 Andrey Filonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    let tableDataSource = TableDataSource()
    var sortBy = "Number"
    lazy var webViewController = WebViewController()
    var inetIsAvailable = true

    // MARK: - view controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupTable()
    }
    
    // MARK: - Views and controls setup
    /// Setups the view.
    func setupView() {
        title = Table.title
    }
    
    /// Setups Navigation bar.
    func setupNavigationBar() {
        let sortButton = UIBarButtonItem(image: UIImage(named: "sort"),
                                                    style: .plain, target: self,
                                                    action: #selector(presentPicker))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    /// Setups the table for presenting the list of players.
    func setupTable() {
        tableView.dataSource = tableDataSource
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    /// Presents Picker view at the bottom of the screen.
    @objc func presentPicker() {
        let picker = Picker(view: view, sortBy: sortBy)
        picker.pickerDelegate = self
    }
    
    /// Shows Alert view if internet connection is not available
    func showInetIsNotAvailableAlert(title: String) {
        let alert = UIAlertController(title: title, message: "Internet connection is not available.\nReconnect and try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}
// MARK: -
extension ViewController: PickerDelegate {
    /// Hides picker, sorts the list and reloads data into table view.
    func doneChoosingParameter(selectedParameter: String) {
        sortBy = selectedParameter
        view.endEditing(true)
        tableDataSource.sort(sortBy: sortBy)
        tableView.reloadData()
    }
}

// MARK: -
extension ViewController: UITableViewDelegate {
    /// Opens WebView and performs search by player's name on www.basketball-reference.com
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = tableDataSource.players[indexPath.row]
        let urlString = Web.searchUrl + player.firstName + "+" + player.lastName

        guard let url = URL(string: urlString) else {
            print("Error converting \(urlString) to URL link")
            return
        }
        if inetIsAvailable {
            webViewController.activityIndicator.startAnimating()
            webViewController.webView.load(URLRequest(url: url))
            webViewController.webView.alpha = 0.0
            webViewController.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(webViewController, animated: true)
        } else {
            showInetIsNotAvailableAlert(title: Table.title)
        }
    }
}
