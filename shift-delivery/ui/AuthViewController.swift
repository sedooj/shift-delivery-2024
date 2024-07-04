//
//  AuthViewController.swift
//  shift-delivery
//
//  Created by Сергей Герасимов on 04.07.2024.
//

import UIKit
import SnapKit

final class AuthViewController: UIViewController {
    private let infoLabel = UILabel()
    private let phoneLabel = UILabel()
    private let phoneField = UITextField()
    private let authButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Авторизация"
        setupView()
        setupInfolabel()
        setupPhoneTextField()
        setupAuthButton()
    }

    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupAuthButton() {
        self.view.addSubview(self.authButton)
        self.authButton.snp.makeConstraints{ make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.top.equalTo(self.phoneField.snp.bottom).offset(32)
            make.height.equalTo(56)
        }
        self.authButton.setTitle("Войти", for: .normal)
        self.authButton.backgroundColor = .blueButton
        self.authButton.layer.cornerRadius = 16
    }
    
    private func setupPhoneTextField() {
        self.view.addSubview(self.phoneLabel)
        self.phoneLabel.snp.makeConstraints{ make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.top.equalTo(self.infoLabel.snp.bottom).offset(24)
        }
        self.phoneLabel.font = .systemFont(ofSize: 14)
        self.phoneLabel.text = "Телефон"
        
        self.view.addSubview(self.phoneField)
        self.phoneField.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.top.equalTo(self.phoneLabel.snp.bottom).offset(8)
        }
        self.phoneField.placeholder = "Телефон"
        self.phoneField.layer.borderColor = SUIKColors.borderLight?.cgColor
        self.phoneField.layer.borderWidth = 1
        self.phoneField.layer.cornerRadius = 8
    }
    
    private func setupInfolabel() {
        self.view.addSubview(self.infoLabel)
        self.infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(24)
        }
        self.infoLabel.font = .systemFont(ofSize: 16)
        self.infoLabel.text = "Введите номер телефона для входа в личный кабинет"
        self.infoLabel.numberOfLines = 0
    }
}
