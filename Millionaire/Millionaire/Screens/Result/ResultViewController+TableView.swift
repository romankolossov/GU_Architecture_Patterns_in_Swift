//
//  ResultViewController+TableView.swift
//  Millionaire
//
//  Created by Роман Колосов on 31.10.2020.
//

import UIKit

// MARK: - UITableViewDataSource

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameSingleton.shared.gameSessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else { fatalError() }
        
        let gameSession = GameSingleton.shared.gameSessions[indexPath.row]
        
        let date = gameSession.date
        let stringDate = dateFormater.string(from: date)
        
        //  let completion = Int(Double(gameSession.score) / Double(self.numberOfQuestions))
        let completion = Int(Double(gameSession.score) / Double(10))
        
        cell.dateLabel.text = stringDate
        cell.scoreLabel.text = "\(gameSession.score)"
        cell.completionLabel.text = "\(completion)%"
        
        cell.cellDelegate = self
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - ResultTableViewCellDelegate

extension ResultViewController: ResultTableViewCellDelegate {
    func didTapOnDateLabel(dateLabelText: String) {
        print("---Tapped on label")
        print(dateLabelText)
    }
}
