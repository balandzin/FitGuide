//
//  AuthorizationViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 2.05.24.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    // MARK: - GUI Variables
    private let genderSegmentedControl = CustomSegmentedControl(items: ["Male", "Female"])
    private let nameTextField = CustomTextField(withText: "Enter your name")
    private let weightTextField = CustomTextField(withText: "Enter your weight, kg")
    private let heightTextField = CustomTextField(withText: "Enter your height, cm")
    private let calculateBMIButton = CustomButton(withText: "Calculate body mass index")
    
    private lazy var bodyMassIndexLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    } ()
    
    private lazy var idealBodyMassIndexLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    } ()
    
    private let trainProgramButton = CustomButton(withText: "To find an optimal training program")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        setupUI()
        
        genderSegmentedControl.selectedSegmentIndex = 0
        
        calculateBMIButton.addTarget(self, action: #selector(calculateBMIButtonTapped), for: .touchUpInside)
        trainProgramButton.addTarget(self, action: #selector(trainProgramButtonTapped), for: .touchUpInside)      
    }
    
    // MARK: - Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.addSubview(nameTextField)
        view.addSubview(genderSegmentedControl)
        view.addSubview(weightTextField)
        view.addSubview(heightTextField)
        view.addSubview(calculateBMIButton)
        view.addSubview(bodyMassIndexLabel)
        view.addSubview(idealBodyMassIndexLabel)
        view.addSubview(trainProgramButton)
        
        view.addSubview(genderSegmentedControl)
        
        setupConstraints()
    }
    
    @objc private func calculateBMIButtonTapped() {
        if !isCorrectData() {
            showAlert(message: "Введите корректные данные пользователя")
            
        } else {
            bodyMassIndexLabel.text = """
            \(nameTextField.text ?? ""),  ваш индекс массы тела:
            \(getBodyMassIndex().0) - \(getBodyMassIndex().1)
            """
            
            if genderSegmentedControl.selectedSegmentIndex == 0 {
                idealBodyMassIndexLabel.text = "Идеальный индекс массы тела для мужчины равен 23"
            } else {
                idealBodyMassIndexLabel.text = "Идеальный индекс массы тела для женщины равен 21.5"
            }
        }
        
        view.endEditing(true)
    }
    
    @objc private func trainProgramButtonTapped() {
        if isCorrectData() {
            navigationController?.pushViewController(ProgramViewController(), animated: true)
        } else {
            showAlert(message: "Введите корректные данные пользователя")
        }
    }
    
    private func setupConstraints() {
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        genderSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        weightTextField.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        heightTextField.snp.makeConstraints { make in
            make.top.equalTo(weightTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        calculateBMIButton.snp.makeConstraints { make in
            make.top.equalTo(heightTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        bodyMassIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(calculateBMIButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        idealBodyMassIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(bodyMassIndexLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        trainProgramButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
            
        }
    }
    
    private func getBodyMassIndex() -> (Double, String) {
        var conclusion = ""
        let height = Double(heightTextField.text ?? "1") ?? 1
        let weight = Double(weightTextField.text ?? "0") ?? 0
        
        
        let bodyMassIndex = weight / (height * height / 10000)
        let roundedIndex = round(bodyMassIndex * 10)/10
        
        switch bodyMassIndex {
        case ..<16: conclusion = "Выраженный дефицит массы тела"
        case 16..<18.5: conclusion = "Недостаточная масса тела (дефицит)"
        case 18.5..<25: conclusion = "Норма"
        case 25..<30: conclusion = "Избыточная масса тела (состояние, предшествующее ожирению)"
        case 30..<35: conclusion = "Ожирение 1-й степени"
        case 35..<40: conclusion = "Ожирение 2-й степени"
        default:
            conclusion = "Ожирение 3-й степени"
        }
        
        return (roundedIndex, conclusion)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func isCorrectData() -> Bool {
        let height = Double(heightTextField.text ?? "1") ?? 1
        let weight = Double(weightTextField.text ?? "0") ?? 0
        
        if nameTextField.text != "" && (100...250).contains(height) && (20...200).contains(weight) {
            return true
        } else {
            return false
        }
    }
}