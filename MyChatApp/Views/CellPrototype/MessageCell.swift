//
//  MessageCell.swift
//  MyChatApp
//
//  Created by иван Бирюков on 10.03.2023.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var youImage: UIImageView!
    @IBOutlet weak var meImage: UIImageView!
    @IBOutlet weak var bubleView: UIView!
    @IBOutlet weak var messageTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bubleView.layer.cornerRadius = bubleView.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
