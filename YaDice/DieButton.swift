//
//  DieButton.swift
//  YaDice
//
//  Created by Qiankang Zhou on 7/20/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit

class DieButton: UIButton {
    var num: UInt32
    var frozen: Bool
    var nonfrozenColor: UIColor
    let frozenColor: UIColor
    required init?(coder aDecoder: NSCoder) {
        self.num = 6
        self.frozen = false
        self.nonfrozenColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.frozenColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 20.0;
    }
    func toggleFrozen() {
        self.frozen = !self.frozen
        if (self.frozen) {
            self.backgroundColor = self.frozenColor
        } else {
            self.backgroundColor = self.nonfrozenColor
        }
    }
}
