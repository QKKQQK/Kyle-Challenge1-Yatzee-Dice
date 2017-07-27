//
//  ViewController.swift
//  YaDice
//
//  Created by Qiankang Zhou on 7/20/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cheating = false;
    @IBOutlet weak var cheat: UIButton!
    @IBOutlet weak var die1Button: DieButton!
    @IBOutlet weak var die2Button: DieButton!
    @IBOutlet weak var die3Button: DieButton!
    @IBOutlet weak var die4Button: DieButton!
    @IBOutlet weak var die5Button: DieButton!
    @IBOutlet weak var horizontalStack: UIStackView!
    @IBOutlet weak var verticalStack1: UIStackView!
    @IBOutlet weak var verticalStack2: UIStackView!
    
    
    func is3DTouchAvailable() -> Bool {
        return self.traitCollection.forceTouchCapability == UIForceTouchCapability.available
    }
    
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sumLabel.text = "Score: 30"
        for view in horizontalStack.subviews {
            if let sview = view as? UIStackView {
                for ssview in sview.subviews{
                    if let btn = ssview as? DieButton {
                        btn.setTitle("\(btn.num)", for: .normal)
                    }
                }
            }
        }
        let forceTouchGestureRecognizer = ForceTouchGestureRecognizer(target: self, action: #selector(forceTouchHandler(value:)), threshold: 0.75)
        
        cheat.addGestureRecognizer(forceTouchGestureRecognizer)
    }

    @objc func forceTouchHandler(value: ForceTouchGestureRecognizer)
    {
        if value.state == UIGestureRecognizerState.ended
        {
            cheating = true;
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
    
    @IBAction func rollTapped(_ sender: UIBarButtonItem) {
        for view in horizontalStack.subviews {
            if let sview = view as? UIStackView {
                for ssview in sview.subviews{
                    if let btn = ssview as? DieButton {
                        if (!btn.frozen) {
                            if (!cheating) {
                            btn.num = arc4random_uniform(6) + 1
                            } else{
                                btn.num = 6
                            }
                            btn.setTitle("\(btn.num)", for: .normal)
                        }
                    }
                }
            }
        }
        cheating = false
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

