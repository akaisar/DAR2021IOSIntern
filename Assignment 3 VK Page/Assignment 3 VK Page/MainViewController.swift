//
//  MainViewController.swift
//  Assignment 3 VK Page
//
//  Created by Kaysar Altynbek on 27.01.2021.
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
        imageView.image = UIImage(named: "vk_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var spaceBetweeIconImageAndLoginTextField: UIView = {
        let view = UIView()
        return view
    }()

    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email или телефон"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        textField.isSecureTextEntry = true
        let imageView = UIImageView()
        imageView.image = UIImage(named: "question")
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        textField.rightView = imageView
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(red: 168/255, green: 194/255, blue: 229/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var enterByAppleView: PrimaryView = {
        let view = PrimaryView();
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        [cancelButton, iconImageView, loginTextField, passwordTextField, enterButton, enterByAppleView, spaceBetweenCancelButtonAndIconImage, spaceBetweeIconImageAndLoginTextField].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        spaceBetweenCancelButtonAndIconImage.heightAnchor.constraint(equalToConstant: view.bounds.height/100*15).isActive = true
        spaceBetweenCancelButtonAndIconImage.topAnchor.constraint(equalTo: cancelButton.bottomAnchor).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: spaceBetweenCancelButtonAndIconImage.bottomAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        spaceBetweeIconImageAndLoginTextField.heightAnchor.constraint(equalToConstant: view.bounds.height/100*12).isActive = true
        spaceBetweeIconImageAndLoginTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: spaceBetweeIconImageAndLoginTextField.bottomAnchor).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        enterByAppleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        enterByAppleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterByAppleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterByAppleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterByAppleView.setParameters(imageName: "apple_logo", title: "Войти через Apple")
    }

    // MARK: - Actions -
    @objc func enterButtonPressed() {
        print(#function)
    }
}

