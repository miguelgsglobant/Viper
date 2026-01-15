//
//  PersonDetailView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
import UIKit

class PersonDetailView: UIView{
    
    let surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Surname"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(surnameLabel)
        NSLayoutConstraint.activate([
            surnameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            surnameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            surnameLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
