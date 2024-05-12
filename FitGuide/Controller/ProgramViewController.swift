//
//  ProgramViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 3.05.24.
//

import UIKit

final class ProgramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Программа тренировок"
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "exercise")
    }
    
}

// MARK: - UITableView
extension ProgramViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let program = Exercises.getProgram()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exercise", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        
        if indexPath.row == 0 {
            content.text = program[indexPath.section].exercises1
            content.image = UIImage(systemName: "figure.run")
        } else if indexPath.row == 1 {
            content.text = program[indexPath.section].exercises2
            content.image = UIImage(systemName: "dumbbell")
        } else if indexPath.row == 2 {
            content.text = program[indexPath.section].exercises3
            content.image = UIImage(systemName: "dumbbell.fill")
        } else if indexPath.row == 3 {
            content.text = program[indexPath.section].exercises4
            content.image = UIImage(systemName: "dumbbell")
        } else if indexPath.row == 4 {
            content.text = program[indexPath.section].exercises5
            content.image = UIImage(systemName: "dumbbell.fill")
        } else if indexPath.row == 5 {
            content.text = program[indexPath.section].exercises6
            content.image = UIImage(systemName: "figure.cooldown")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let program = Exercises.getProgram()
        return program[section].day
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// ПРОВЕРКА коммитов
