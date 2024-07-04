//
//  AuthViewController.swift
//  shift-delivery
//
//  Created by Сергей Герасимов on 04.07.2024.
//

import UIKit

final class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Авторизация"
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
    }
}
