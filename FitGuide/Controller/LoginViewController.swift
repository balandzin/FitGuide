//
//  LoginViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 16.05.24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private var user = User()
    
    // MARK: - GUI Variables
    private let loginTextField = CustomTextField(withText: AppConstants.loginTextFieldText)
    private let passwordTextField = CustomTextField(withText: AppConstants.passwordTextFieldText)
    private let loginButton = CustomButton(withText: "Login")
    
    private let userExerciseStorage = UserExerciseStorage.shared
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.tintColor = .blue
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupButtonTarget()
    }
    
    private func setupUI() {
        view.addSubviews([loginTextField, passwordTextField, loginButton, registerButton])
        
        setupConstraints()
        
        view.addVerticalGradientLayer()
        title = "Sign In"
    }
    
    // MARK: - Private Methods
    private func setupButtonTarget() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
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
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.width.equalTo(100)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(20)
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
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if userExerciseStorage.checkCredentials(login: login, password: password)
            && user.isCorrectData(login: login, password: password) {
            
            user.login = login
            user.password = password
            
            navigationController?.setViewControllers(
                [ProgramViewController(user: user)],
                animated: true
            )
        } else {
            showAlert(message: AppConstants.incorrectLoginOrPassword)
        }
    }
    
    @objc private func registerButtonTapped() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
