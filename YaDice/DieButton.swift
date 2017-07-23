//
//  DieButton.swift
//  YaDice
//
//  Created by Qiankang Zhou on 7/20/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit

class DieButton: UIButton {
    var num: UInt32? = 6;
    var frozen = false
    let nonfrozenColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
    let frozenColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    /*
         is it frozen
         background color for frozen
         background color for non frozen
     */
}
