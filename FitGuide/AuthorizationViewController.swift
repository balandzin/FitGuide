//
//  AuthorizationViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 2.05.24.
//

import UIKit

final class AuthorizationViewController: UIViewController {

    // MARK: - GUI Variables
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.placeholder = "Enter your name"
        textField.backgroundColor = .white
        textField.autocapitalizationType = .words
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var weightTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.placeholder = "Enter your weight, kg"
        textField.backgroundColor = .white
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var heightTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.placeholder = "Enter your height, cm"
        textField.backgroundColor = .white
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var calculateBMIButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Calculate body mass index", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
//        // Добавляем границу кнопки
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.darkGray.cgColor
//
//        // Добавляем тень кнопке
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 0, height: 3)
//        button.tintColor = .black
        return button
    }()
    
    private lazy var bodyMassIndexLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    } ()
    
    private lazy var trainProgramButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("To find an optimal training program", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.addSubview(nameTextField)
        view.addSubview(genderSegmentedControl)
        view.addSubview(weightTextField)
        view.addSubview(heightTextField)
        view.addSubview(calculateBMIButton)
        view.addSubview(bodyMassIndexLabel)
        view.addSubview(trainProgramButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        genderSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        weightTextField.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        heightTextField.snp.makeConstraints { make in
            make.top.equalTo(weightTextField.snp.bottom).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        calculateBMIButton.snp.makeConstraints { make in
            make.top.equalTo(heightTextField.snp.bottom).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        bodyMassIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(calculateBMIButton.snp.bottom).offset(20)
            //make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        trainProgramButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
