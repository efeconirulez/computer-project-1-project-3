//
//  WhileViewController.swift
//  teachokiddo
//
//  Created by Efe Helvacı on 30.11.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit

class WhileViewController: UIViewController {

    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var balloonImage: UIImageView!
    @IBOutlet weak var balloonWidth: NSLayoutConstraint!
    @IBOutlet weak var informativeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var remainingPump = 10 {
        didSet {
            if remainingPump == 0 {
                informativeLabel.text = "Balonu başarıyla şişirdin bir sonraki görevine devam edebilirsin :)"
                nextButton.isHidden = false
            } else if remainingPump < 0 {
                isPopped = true
                informativeLabel.text = "Eyvah patladı!"
                nextButton.isHidden = true
            } else {
                informativeLabel.text = "Balonu \(remainingPump) defa şişir"
            }
        }
    }
    
    var isPopped = false {
        didSet {
            if isPopped {
                popImage.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sisir(_ sender: UIButton) {
        guard !isPopped else { return }
        
        balloonWidth.constant = balloonWidth.constant + 20.0
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        remainingPump -= 1
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
