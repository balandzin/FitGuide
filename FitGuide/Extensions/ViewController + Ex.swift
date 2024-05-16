//
//  ViewController + Ex.swift
//  FitGuide
//
//  Created by Антон Баландин on 16.05.24.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
