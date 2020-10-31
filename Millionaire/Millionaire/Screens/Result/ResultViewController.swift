//
//  ResultViewController.swift
//  Millionaire
//
//  Created by Роман Колосов on 31.10.2020.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "ResultTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ResultTableViewCell")
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
// MARK: - Actions
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { fatalError() }
        
        dismiss(animated: true, completion: nil)
        present(mainVC, animated: true, completion: nil)
    }
}
 



