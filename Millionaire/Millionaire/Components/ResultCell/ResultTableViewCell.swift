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
    
    // MARK: - Actions
    
    @objc func didTapOnLabel() {
        cellDelegate.didTapOnDateLabel(dateLabelText: dateLabel.text ?? "")
    }
}
