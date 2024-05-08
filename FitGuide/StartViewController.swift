//
//  StartViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 18.04.24.
//

import SnapKit
import UIKit

final class StartViewController: UIViewController {

    // MARK: - GUI Variables
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setImage(UIImage(systemName: "dumbbell.fill"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var aboutAppButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("About App", for: .normal)
        button.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer()
        setupUI()
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        aboutAppButton.addTarget(self, action: #selector(aboutAppButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    @objc private func startButtonTapped() {
        navigationController?.pushViewController(AuthorizationViewController(), animated: true)
    }
    
    @objc private func aboutAppButtonTapped() {
        navigationController?.pushViewController(AboutAppViewController(), animated: true)
    }
    
    private func setupUI() {
        view.addSubview(startButton)
        view.addSubview(aboutAppButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(70)
        }
        
        aboutAppButton.snp.makeConstraints { make in
            make.top.equalTo(startButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }

}
