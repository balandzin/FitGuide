//
//  RegisterViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 16.05.24.
//

import UIKit

final class RegisterViewController: UIViewController {
    // MARK: - GUI Variables
    private let loginTextField = CustomTextField(withText: "Enter your login")
    private let passwordTextField = CustomTextField(withText: "Enter your password")
    private let registerButton = CustomButton(withText: "Save")
    
    private let userExerciseStorage = UserExerciseStorage.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()

        title = "Register"
      setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        
        setupConstraints()
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.width.equalTo(100)
        }
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
        
        guard let login = loginTextField.text, !login.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            return false
        }
        return true
    }
    
    // MARK: - Actions
    @objc private func registerButtonTapped() {
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if isCorrectData() {
            if !userExerciseStorage.checkCredentials(login: loginTextField.text ?? "", password: passwordTextField.text ?? "") {
                
                userExerciseStorage.addUserData(login: loginTextField.text ?? "", password: passwordTextField.text ?? "", exercises: [])
                
                navigationController?.pushViewController(AuthorizationViewController(login: login, password: password), animated: true)
            } else {
                showAlert(message: "This user already exists")
            }
        } else {
            showAlert(message: "Incorrect login or password")
        }
    }
}
