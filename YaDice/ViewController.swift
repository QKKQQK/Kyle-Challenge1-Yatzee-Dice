//
//  ViewController.swift
//  YaDice
//
//  Created by Qiankang Zhou on 7/20/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var die1Button: DieButton!
    @IBOutlet weak var die2Button: DieButton!
    @IBOutlet weak var die3Button: DieButton!
    @IBOutlet weak var die4Button: DieButton!
    @IBOutlet weak var die5Button: DieButton!
    @IBOutlet weak var horizontalStack: UIStackView!
    @IBOutlet weak var verticalStack1: UIStackView!
    @IBOutlet weak var verticalStack2: UIStackView!
    
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sumLabel.text = "Score: 0"
        for view in horizontalStack.subviews {
            if let sview = view as? UIStackView {
                for ssview in sview.subviews{
                    if let btn = ssview as? DieButton {
                        btn.setTitle("\(btn.num)", for: .normal)
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dieTapped(_ sender: DieButton) {
        sender.frozen = !sender.frozen
        if (sender.frozen) {
            sender.backgroundColor = sender.frozenColor
        } else {
            sender.backgroundColor = sender.nonfrozenColor
        }
    }
    
    @IBAction func rollTapped(_ sender: UIButton) {
        for view in horizontalStack.subviews {
            if let sview = view as? UIStackView {
                for ssview in sview.subviews{
                    if let btn = ssview as? DieButton {
                        if (!btn.frozen) {
                            btn.num = arc4random_uniform(6) + 1
                            btn.setTitle("\(btn.num)", for: .normal)
                        }
                    }
                }
            }
        }
        sumLabel.text = "Score: \(sum())"
    }
    
    func sum() -> UInt32 {
        var sumDice: UInt32 = 0;
        for view in horizontalStack.subviews {
            if let sview = view as? UIStackView {
                for ssview in sview.subviews{
                    if let btn = ssview as? DieButton {
                        sumDice += btn.num
                    }
                }
            }
        }
        return sumDice;
    }
}

