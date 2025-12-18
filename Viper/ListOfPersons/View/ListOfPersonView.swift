//
//  ListOfPersonView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
import UIKit

final class ListOfPersonView: UIView {
    
    var personTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PersonCellView.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(personTableView)
        NSLayoutConstraint.activate([
            personTableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            personTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            personTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            personTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
