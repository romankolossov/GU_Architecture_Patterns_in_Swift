//
//  ResultTableViewCell.swift
//  Millionaire
//
//  Created by Роман Колосов on 31.10.2020.
//

import UIKit

protocol ResultTableViewCellDelegate: AnyObject {
    func didTapOnDateLabel(dateLabelText: String)
}

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var completionLabel: UILabel!
    
    let dateFormater: DateFormatter = {
        let datefFormater = DateFormatter()
        datefFormater.dateFormat = "dd.MM.yyyy HH.mm"
        
        return datefFormater
    }()
    
    // Delegate property
    weak var cellDelegate: ResultTableViewCellDelegate!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnLabel))
        
        dateLabel.addGestureRecognizer(tapGesture)
        dateLabel.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Major Methods
    
    func lookCofigure(with viewModel: GameSession) {
        let completion = Int(Double(viewModel.score) / Double(viewModel.questionsInGame))
        
        let date = viewModel.date
        let stringDate = dateFormater.string(from: date)
        
        dateLabel.text = stringDate
        scoreLabel.text = "\(viewModel.score)"
        completionLabel.text = "\(completion)%"
    }
    
    // MARK: - Actions
    
    @objc func didTapOnLabel() {
        cellDelegate.didTapOnDateLabel(dateLabelText: dateLabel.text ?? "")
    }
}
