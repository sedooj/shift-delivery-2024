//
//  TextField.swift
//  shift-delivery
//
//  Created by Сергей Герасимов on 06.07.2024.
//

import UIKit
import SnapKit

final class TextField: UITextField {
    private let paddings = UIEdgeInsets(
        top: 12,
        left: 12,
        bottom: 12,
        right: 12
    )
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: self.paddings)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: self.paddings)
    }
    
    init() {
        super.init(frame: .zero)
        setupTextField()
    }
    
    private func setupTextField() {
        self.snp.makeConstraints { make in
            make.height.equalTo(AppConstants.textFieldHeight)
        }
        self.layer.borderColor = AppColors.borderLight?.cgColor
        self.layer.borderWidth = AppConstants.textFieldBorderWidth
        self.layer.cornerRadius = AppConstants.textFieldCornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

