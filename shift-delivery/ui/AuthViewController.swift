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
    private let textFieldStackView = UIStackView()
    private let phoneField = TextField()
    private let codeField = TextField()
    private let authButton = UIButton()
    private let sendCodeAgainButton = UIButton()
    
    private enum CodeFieldState {
        case INIT, PHONE_ENTERED
    }
    
    
    private var state:CodeFieldState = .INIT {
        didSet {
            updateCodeFieldState()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Авторизация"
        setupView()
        setupInfolabel()
        setupTextFieldStackView()
        setupPhoneTextField()
        setupCodeTextField()
        setupAuthButton()
        setupSendCodeAgainButton()
    }

    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupSendCodeAgainButton() {
        self.view.addSubview(self.sendCodeAgainButton)
        self.sendCodeAgainButton.snp.makeConstraints { make in
            make.top.equalTo(self.authButton.snp.bottom).offset(AppConstants.topPadding)
            make.leading.trailing.equalToSuperview().inset(AppConstants.leadingPadding)
            make.height.equalTo(AppConstants.buttonHeight)
        }
        self.sendCodeAgainButton.setTitle("Отправить код еще раз", for: .normal)
        self.sendCodeAgainButton.addTarget(self, action: #selector(onSendCodeAgainButtonPress), for: .touchUpInside)
        self.sendCodeAgainButton.setTitleColor(AppColors.secondaryText, for: .normal)
        self.sendCodeAgainButton.isHidden = true
    }
    
    @objc
    private func onSendCodeAgainButtonPress() {
        // request for new code
        self.sendCodeAgainButton.setTitle("Отправить код повторно через 60 сек", for: .normal)
    }
    
    private func setupTextFieldStackView() {
        self.view.addSubview(self.textFieldStackView)
        self.textFieldStackView.snp.makeConstraints { make in
            make.top.equalTo(self.infoLabel.snp.bottom).offset(AppConstants.topPadding)
            make.trailing.leading.equalToSuperview().offset(AppConstants.leadingPadding)
        }
        self.textFieldStackView.axis = .vertical
        self.textFieldStackView.spacing = AppConstants.textFieldStackViewSpacing
        
    }
    
    private func setupAuthButton() {
        self.view.addSubview(self.authButton)
        self.authButton.snp.makeConstraints{ make in
            make.trailing.leading.equalToSuperview().inset(AppConstants.leadingPadding)
            make.top.equalTo(self.textFieldStackView.snp.bottom).offset(32)
            make.height.equalTo(AppConstants.buttonHeight)
        }
        self.authButton.setTitle("Войти", for: .normal)
        self.authButton.backgroundColor = AppColors.bgBrand
        self.authButton.layer.cornerRadius = AppConstants.buttonCornerRadius
        self.authButton.addTarget(self, action: #selector(onAuthButtonPress), for: .touchUpInside)
    }
    
    private func validateInputPhone() -> Bool {
        return self.phoneField.text?.isEmpty == false
    }
    
    private func updateCodeFieldState() {
        switch self.state {
        case .INIT:
            self.codeField.isHidden = true
            break
        case .PHONE_ENTERED:
            self.codeField.isHidden = false
            break
        }
    }
    
    @objc
    private func onAuthButtonPress() {
        guard self.validateInputPhone() else { return }
        switch self.state {
        case .INIT:
            self.state = .PHONE_ENTERED
            self.sendCodeAgainButton.isHidden = false
            break
        case .PHONE_ENTERED:
            // do request
            break
        }
    }
    
    private func setupPhoneTextField() {
        self.textFieldStackView.addArrangedSubview(self.phoneField)
        self.phoneField.placeholder = "Телефон"
    }
    
    private func setupCodeTextField() {
        self.textFieldStackView.addArrangedSubview(self.codeField)
        self.codeField.placeholder = "Проверочный код"
        self.codeField.isHidden = true
    }
    
    private func setupInfolabel() {
        self.view.addSubview(self.infoLabel)
        self.infoLabel.text = "Введите номер телефона для входа в личный кабинет"
        self.infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(AppConstants.leadingPadding)
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(AppConstants.topPadding)
        }
        self.infoLabel.font = .systemFont(ofSize: AppConstants.fontSize)
        self.infoLabel.numberOfLines = 0
    }
}
