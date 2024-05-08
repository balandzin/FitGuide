//
//  ProgramViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 3.05.24.
//

import UIKit

class ProgramViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let exercisesData = Bundle.main.decode(ExercisesData.self, from: "data.json")
        print(exercisesData)
        
    }
}
