//
//  ViewController.swift
//  YaDice
//
//  Created by Qiankang Zhou on 7/20/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    var cheating = false;
    @IBOutlet weak var cheat: UIButton!
    @IBOutlet weak var rollButton: UIBarButtonItem!
    
    @IBOutlet weak var die1: DieButton!
    @IBOutlet weak var die2: DieButton!
    @IBOutlet weak var die3: DieButton!
    @IBOutlet weak var die4: DieButton!
    @IBOutlet weak var die5: DieButton!

    let dice = DiceController()
    
    func is3DTouchAvailable() -> Bool {
        return self.traitCollection.forceTouchCapability == UIForceTouchCapability.available
    }
    
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumLabel.text = "Score: 0"
        dice.diceArray = [die1, die2, die3, die4, die5]
        let forceTouchGestureRecognizer = ForceTouchGestureRecognizer(target: self, action: #selector(forceTouchHandler(value:)), threshold: 0.75)
        
        if (is3DTouchAvailable()) {
            cheat.addGestureRecognizer(forceTouchGestureRecognizer)
        }
        dice.reset()
        rollButton.title = dice.rollButtonTitle
        view.setNeedsDisplay()
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
        sender.toggleFrozen()
    }
    
    @IBAction func rollTapped(_ sender: UIBarButtonItem) {
        let url = Bundle.main.url(forResource: "diceSound", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        dice.rollDice(cheating)
        cheating = false
        sumLabel.text = "Score: \(dice.getScore())"
        rollButton.title = dice.rollButtonTitle
        view.setNeedsDisplay()
    }
}

