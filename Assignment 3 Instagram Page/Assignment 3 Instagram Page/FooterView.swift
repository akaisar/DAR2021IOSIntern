//
//  FooterView.swift
//  Assignment 3 Instagram Page
//
//  Created by Kaysar Altynbek on 28.01.2021.
//

import UIKit

class FooterView: UIView {
    
    lazy var leftLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 145/255, blue: 238/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    lazy var leftLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 145/255, blue: 238/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setParameters(imageName: String, title: String) {
        self.titleLabel.text = title
        guard let image = UIImage(named: imageName) else { return }
        self.leftImageView.image = image
        
    }
    
    private func setupViews() {
        [leftImageView, titleLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        leftImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        leftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44).isActive = true
        leftImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        leftImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -44).isActive = true
    }

}
