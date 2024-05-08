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
    
    let dumbbellImageView = UIImageView()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer()
        setupUI()
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        aboutAppButton.addTarget(self, action: #selector(aboutAppButtonTapped), for: .touchUpInside)
        
        
        // Установка изображения гантели
        dumbbellImageView.image = UIImage(named: "dumbbell")
        dumbbellImageView.contentMode = .scaleAspectFit
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Создание анимации вращения гантели
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .curveLinear], animations: {
            self.dumbbellImageView.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: nil)
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
        view.addSubview(dumbbellImageView)

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
        
        dumbbellImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
    }
    
}
