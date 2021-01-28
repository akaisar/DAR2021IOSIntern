//
//  RegisterView.swift
//  Assignment 3 VK Page
//
//  Created by Kaysar Altynbek on 28.01.2021.
//

import UIKit

class RegisterView: UIView {
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет аккаунта?"
        label.textColor = UIColor(red: 167/255, green: 167/255, blue: 167/255, alpha: 1)
        return label
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрируйтесь.", for: .normal)
        button.setTitleColor( UIColor(red: 30/255, green: 146/255, blue: 238/255, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [leftLabel, rightButton].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        leftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        leftLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        rightButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        rightButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        rightButton.leadingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    //MARK: -functions-
    
    @objc func registrationButtonPressed() {
        print(#function)
    }
}
