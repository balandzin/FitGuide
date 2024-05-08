//
//  CustomSegmentedControl.swift
//  FitGuide
//
//  Created by Антон Баландин on 9.05.24.
//

import UIKit

class CustomSegmentedControl: UISegmentedControl {
    override init(items: [Any]?) {
        super.init(items: items)
        setupSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSegmentedControl()
    }
    
    func setupSegmentedControl() {
        layer.cornerRadius = 8 // Устанавливаем закругленные углы
        layer.shadowColor = UIColor.black.cgColor // Цвет тени
        layer.shadowOffset = CGSize(width: 0, height: 6) // Смещение тени
        layer.shadowOpacity = 0.3 // Непрозрачность тени
        layer.shadowRadius = 2 // Радиус размытия тени
        
        for _ in 0..<numberOfSegments {
            setTitleTextAttributes([.foregroundColor: UIColor.blue], for: .normal) // Устанавливаем цвет текста для нормального состояния
            setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected) // Устанавливаем цвет текста для выбранного состояния
        }
    }
}

