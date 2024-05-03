//
//  AboutAppViewController.swift
//  FitGuide
//
//  Created by Антон Баландин on 2.05.24.
//

import UIKit

final class AboutAppViewController: UIViewController {
    
    private let telegramLink = "https://t.me/+375336886070"
    
    // MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var telegramLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupText()
        
        let attributedString = NSMutableAttributedString(string: "Нажмите, чтобы связаться с разработчиком в Telegram")
        let linkRange = attributedString.mutableString.range(of: "Telegram")
        attributedString.addAttribute(.link, value: telegramLink, range: linkRange)
        telegramLabel.attributedText = attributedString
                
        telegramLabel.isUserInteractionEnabled = true
        telegramLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openTelegramLink)))
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(telegramLabel)
        setupConstraints()
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
        descriptionLabel.text = """
            Добро пожаловать в наше приложение по составлению программы тренировок в тренажерном зале! Мы рады приветствовать тебя в нашем фитнес-мире, где ты сможешь создать идеальную программу тренировок, а также получить максимальные результаты.
            
            Приложение разработано с учетом потребностей как начинающих спортсменов, так и опытных тренирующихся. Мы предлагаем удобный и интуитивно понятный интерфейс, который позволит тебе легко составить программу тренировок, подходящую именно тебе.
            Мы поможем вам пользователю составить корректную программу тренировок в соответствии с текущим состоянием тела и антропометрическими параметрами. Тренировки предусматривают различные цели (набор мышечной массы, сжигагние излишнего подкожного жира)
            
            Программа предусматривает трехдневный режим тернировок, которые генерируются в случайном порядке, что сделает ваш путь к идеальному телу разнообразным и интересным
            
            Команда разработчиков предлагает вам тренировочную программу по сплиту следующей схемы:
            
                 ДЕНЬ 1: Спина + Трицепс
                 ДЕНЬ 2: ОТДЫХ
                 ДЕНЬ 3: Грудь + Бицепс
                 ДЕНЬ 4: ОТДЫХ
                 ДЕНЬ 5: Ноги + Плечи
                 ДЕНЬ 6: ОТДЫХ
                 ДЕНЬ 7: ОТДЫХ
            
            В свою очередь, пользователь может корректировать ее в соответствии со своими пожеланиями
            
            Так что не теряй время и приступай к тренировкам уже сегодня! Дарим тебе возможность преобразить свое тело и достичь желаемых результатов. Успехов и приятных тренировок!
            
            
            Разработчик:
            Баландин Антон
            """
    }
    
    @objc func openTelegramLink() {
            if let url = URL(string: "https://t.me/yourtelegramusername") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
}
