//
//  MainViewController.swift
//  Assignment 3 Instagram Page
//
//  Created by Kaysar Altynbek on 28.01.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "cancel"), for: .normal)
        return button
    }()
    
    lazy var spaceBetweenCancelButtonAndIconImage: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "instagram_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Телефон, имя пользователя или эл. адрес"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 3
        textField.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        textField.textColor = UIColor(red: 154, green: 154, blue: 154, alpha: 1)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1).cgColor
        textField.textColor = UIColor(red: 154, green: 154, blue: 154, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        textField.isSecureTextEntry = true
        let imageView = UIImageView()
        imageView.image = UIImage(named: "eye")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        textField.rightView = imageView
        textField.rightViewMode = .always
        textField.addTarget(self, action: #selector(passwordValidate), for: .valueChanged)
        return textField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(UIColor(red: 30/255, green: 146/255, blue: 238/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(forgotPasswordButtonPresssed), for: .touchUpInside)
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(red: 142/255, green: 200/255, blue: 245/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Или"
        label.textColor = UIColor(red: 138/255, green: 138/255, blue: 138/255, alpha: 1)
        return label
    }()
    
    lazy var enterByFacebookView: PrimaryView = {
        let view = PrimaryView();
        return view
    }()
    
    lazy var registerView: UIView = {
        let view = RegisterView()
        view.layer.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        [cancelButton, iconImageView, loginTextField, passwordTextField, enterButton, enterByFacebookView, spaceBetweenCancelButtonAndIconImage, forgotPasswordButton, orLabel, registerView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        spaceBetweenCancelButtonAndIconImage.heightAnchor.constraint(equalToConstant: view.bounds.height/100*12).isActive = true
        spaceBetweenCancelButtonAndIconImage.topAnchor.constraint(equalTo: cancelButton.bottomAnchor).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: spaceBetweenCancelButtonAndIconImage.bottomAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        orLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 30).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        enterByFacebookView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 30).isActive = true
        enterByFacebookView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterByFacebookView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterByFacebookView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterByFacebookView.setParameters(imageName: "facebook_logo", title: "Войти через Facebook")
        
        registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    // MARK: - Actions -
    @objc func enterButtonPressed() {
        print(#function)
    }
    
    @objc func forgotPasswordButtonPresssed() {
        print(#function)
    }
    
    @objc func passwordValidate() {
        
    }
    
}

