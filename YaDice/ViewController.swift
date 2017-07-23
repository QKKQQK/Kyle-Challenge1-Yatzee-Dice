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
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sumLabel.text = "Sum: 0"
        for view in self.view.subviews as [UIView] {
            if let btn = view as? DieButton {
                //btn.num = arc4random_uniform(6) + 1
                btn.setTitle("\(btn.num!)", for: .normal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dieTapped(_ sender: DieButton) {
        sender.setTitle("\(sender.num!)", for: UIControlState.normal)
        print("Tapped \(sender.num!)")
    }
    @IBAction func rollTapped(_ sender: UIButton) {
        for view in self.view.subviews as [UIView] {
            if let btn = view as? DieButton {
                btn.num = arc4random_uniform(6) + 1
                btn.setTitle("\(btn.num!)", for: .normal)
            }
        }
        sumLabel.text = "Sum: \(sum())"
        print(sum())
    }
    
    func sum() -> UInt32 {
        var sumDice: UInt32 = 0;
        for view in self.view.subviews as [UIView] {
            if let btn = view as? DieButton {
                sumDice += btn.num!
            }
        }
        return sumDice;
    }
}

