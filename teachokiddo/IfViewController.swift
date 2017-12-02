//
//  IfViewController.swift
//  teachokiddo
//
//  Created by Efe Helvacı on 1.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit
import SwifterSwift

class IfViewController: BaseViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var popImageView: UIImageView!
    @IBOutlet weak var balloonImageView: UIImageView!
    
    let colors: [UIColor] = [.green, .yellow, .red, .cyan, .blue, .magenta]
    
    var currentColor: UIColor = .red
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Skor: \(score)"
        }
    }
    
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { (_) in
            self.popImageView.isHidden = true
            
            let randomColor = self.colors.randomItem
            
            self.balloonImageView.image = UIImage(named: "fillableBalloon")?.filled(withColor: randomColor)
            self.currentColor = randomColor
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTriggerButton(_ sender: UIButton) {
        if currentColor == .yellow {
            self.popImageView.isHidden = false
            
            score += 1
        } else {
            score -= 1
        }
    }
    

    
}
