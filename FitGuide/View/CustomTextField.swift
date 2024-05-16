//
//  CustomTextField.swift
//  FitGuide
//
//  Created by Антон Баландин on 9.05.24.
//

import UIKit

final class CustomTextField: UITextField {
    
    init(withText text: String) {
        super.init(frame: .zero)
        placeholder = text
        backgroundColor = .white
        borderStyle = .roundedRect
        tintColor = .black
        layer.cornerRadius = 10
        
        // Тени
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
