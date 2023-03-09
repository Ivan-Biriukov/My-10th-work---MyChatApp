//
//  WellcomeViewController.swift
//  Chat's app
//
//  Created by иван Бирюков on 09.03.2023.
//

import UIKit

class WellcomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var charIndex = 0.0
    let titleText = " Chat App 💬"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateLabelText()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        titleLabel.text = ""
        charIndex = 0.0
    }
    
    func configLabel() {
        titleLabel.text = ""
        titleLabel.font = .systemFont(ofSize: 50, weight: .black)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
    }
    
    func animateLabelText() {
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.3 * charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
}
