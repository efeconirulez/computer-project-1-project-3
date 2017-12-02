//
//  AlgorithmViewController.swift
//  teachokiddo
//
//  Created by Efe Helvacı on 1.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit

class AlgorithmViewController: BaseViewController {

    @IBOutlet weak var executeButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var girlCenterX: NSLayoutConstraint!
    @IBOutlet weak var girlCenterY: NSLayoutConstraint!
    
    @IBOutlet weak var algorithmLabel: UILabel!
    
    var isAnimating = false
    
    var startingX: CGFloat!
    var startingY: CGFloat!
    
    let cellWidth = UIScreen.main.bounds.width / 9.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.startingX = girlCenterX.constant
        self.startingY = girlCenterY.constant
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTriggerExecute(_ sender: UIButton) {
        guard let algorithm = algorithmLabel.text, !algorithm.isEmpty, !isAnimating else {
            self.executeButton.setTitle("ÇALIŞTIR", for: .normal)
            
            self.algorithmLabel.text = ""
            
            girlCenterX.constant = startingX
            girlCenterY.constant = startingY
            
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (_) in
                self.isAnimating = false
            })
            
            return
        }
        
        isAnimating = true
        
        animate(algorithm: algorithm) {
            if algorithm == "➡️➡️➡️➡️⬇️⬇️➡️➡️⬇️⬇️⬅️⬅️⬇️⬇️⬇️➡️➡️⬇️➡️➡️" || algorithm == "➡️➡️➡️➡️⬇️⬇️➡️➡️⬇️⬇️⬅️⬅️⬇️⬇️⬇️➡️➡️⬇️➡️" {
                print("Win")
                
                self.executeButton.setTitle("KAZANDIN", for: .normal)
            } else {
                print("Lose")
                
                self.executeButton.setTitle("YENİDEN DENE", for: .normal)
            }
        }
    }
    
    func animate(algorithm: String, rank: Int = 0, completion: @escaping () -> Void) {
        guard rank < algorithm.count else {
            completion()
            
            return
        }
        
        let index = algorithm.index(algorithm.startIndex, offsetBy: rank)
        
        switch algorithm[index] {
        case "⬅️":
            girlCenterX.constant -= cellWidth
            break
        case "➡️":
            girlCenterX.constant += cellWidth
            break
        case "⬆️":
            girlCenterY.constant -= cellWidth
            break
        case "⬇️":
            girlCenterY.constant += cellWidth
            break
        default:
            break
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
            self.animate(algorithm: algorithm, rank: rank+1, completion: {
                completion()
            })
        }
    }
    
    
    @IBAction func didTriggerLeft(_ sender: UIButton) {
        algorithmLabel.text?.append("⬅️")
    }
    
    @IBAction func didTriggerRight(_ sender: UIButton) {
        algorithmLabel.text?.append("➡️")
    }
    
    @IBAction func didTriggerUp(_ sender: UIButton) {
        algorithmLabel.text?.append("⬆️")
    }
    
    @IBAction func didTriggerDown(_ sender: UIButton) {
        algorithmLabel.text?.append("⬇️")
    }
    
}
