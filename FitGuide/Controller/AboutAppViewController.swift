//
//  AboutAppViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 2.05.24.
//

import UIKit

final class AboutAppViewController: UIViewController {
    
    // MARK: - Properties
    private let telegramLink = AppConstants.telegramLink
    
    // MARK: - GUI Variables
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView = UIView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let telegramLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupText()
        setupLinkAttributesForTelegram()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.addSubviews([scrollView, contentView, descriptionLabel, telegramLabel])
        
        setupConstraints()
        
        view.addVerticalGradientLayer()
        title = "О приложении"
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.width.edges.equalToSuperview()
            make.top.bottom.equalTo(scrollView).inset(70)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        telegramLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setupText() {
        let description = AppConstants.description
        
        let attributedString = NSAttributedString(
            string: description,
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
                         NSAttributedString.Key.foregroundColor: UIColor.black,
                         NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        
        descriptionLabel.attributedText = attributedString
    }
    
    private func setupLinkAttributesForTelegram() {
        let attributedString = NSMutableAttributedString(
            string: "Нажмите, чтобы связаться с разработчиком в Telegram"
        )
        let linkRange = attributedString.mutableString.range(of: "Telegram")
        attributedString.addAttribute(.link, value: telegramLink, range: linkRange)
        telegramLabel.attributedText = attributedString
        
        telegramLabel.isUserInteractionEnabled = true
        telegramLabel.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(openTelegramLink))
        )
    }
    
    @objc func openTelegramLink() {
        if let url = URL(string: telegramLink) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
