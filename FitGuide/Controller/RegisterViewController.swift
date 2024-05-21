//
//  RegisterViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 16.05.24.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    private var user = User()
    
    // MARK: - GUI Variables
    private let loginTextField = CustomTextField(withText: AppConstants.loginTextFieldText)
    private let passwordTextField = CustomTextField(withText: AppConstants.passwordTextFieldText)
    private let registerButton = CustomButton(withText: "Save")
    
    private let userExerciseStorage = UserExerciseStorage.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupButtonTarget()
    }
    
    // MARK: - Private Methods
    private func setupButtonTarget() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        
        setupConstraints()
        
        view.addVerticalGradientLayer()
        title = "Register"
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
            if !userExerciseStorage.checkCredentials(
                login: loginTextField.text ?? "",
                password: passwordTextField.text ?? ""
            ) {
                
                userExerciseStorage.addUserData(
                    login: loginTextField.text ?? "",
                    password: passwordTextField.text ?? "",
                    exercises: []
                )
                
                user.login = login
                user.password = password
                
                navigationController?.setViewControllers(
                    [AuthorizationViewController(user: user)],
                    animated: true
                )
            } else {
                showAlert(message: AppConstants.userExistsMessage)
            }
        } else {
            showAlert(message: AppConstants.incorrectLoginOrPassword)
        }
    }
}
