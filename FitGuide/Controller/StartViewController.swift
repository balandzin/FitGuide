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
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setImage(UIImage(systemName: "dumbbell.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        
        // Тени
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        
        return button
    }()
    
    private let aboutAppButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("About App", for: .normal)
        button.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        button.tintColor = .blue
        return button
    }()
    
    private let dumbbellImageView = UIImageView()
    private var rotateAnimation: CABasicAnimation?
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupButtonTarget()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Перезапуск анимации вращения гантели
        if rotateAnimation == nil {
            let animation = CABasicAnimation(keyPath: "transform.rotation")
            animation.toValue = CGFloat.pi * 2.0
            animation.duration = 7.0
            animation.repeatCount = .infinity
            
            dumbbellImageView.layer.add(animation, forKey: "rotationAnimation")
            rotateAnimation = animation
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Остановка анимации вращения гантели
        if rotateAnimation != nil {
            dumbbellImageView.layer.removeAnimation(forKey: "rotationAnimation")
            rotateAnimation = nil
        }
    }
    
    // MARK: - Private Methods
    @objc private func startButtonTapped() {
        navigationController?.setViewControllers([LoginViewController()], animated: true)
    }
    
    @objc private func aboutAppButtonTapped() {
        navigationController?.pushViewController(AboutAppViewController(), animated: true)
    }
    
    private func setupButtonTarget() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        aboutAppButton.addTarget(self, action: #selector(aboutAppButtonTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.addSubviews([startButton, aboutAppButton, dumbbellImageView])
        
        setupConstraints()
        
        view.addVerticalGradientLayer()
        
        // Установка изображения гантели
        dumbbellImageView.image = UIImage(named: "dumbbell")
        dumbbellImageView.contentMode = .scaleAspectFit
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
            make.top.equalToSuperview().inset(180)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
    }
}
