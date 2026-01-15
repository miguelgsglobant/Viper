//
//  ListOfPersonView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
import UIKit

class ListOfPersonViewController: UIViewController {
    private let presenter: ListOfPersonPresenterProtocol
    private let listOfPersonView = ListOfPersonView()
    
    init(presenter: ListOfPersonPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = listOfPersonView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.onViewApper()
       
    }
    
    private func setupView() {
        listOfPersonView.personTableView.dataSource = self
        listOfPersonView.personTableView.delegate = self
    }
}

extension ListOfPersonViewController: ListOfPersonViewProtocol {
    func updateView(modelView: [PersonCellModel]) {
        DispatchQueue.main.async {
            self.listOfPersonView.personTableView.reloadData()
        }
    }
}

extension ListOfPersonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.personCellModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCellView
        let model = presenter.personCellModelList[indexPath.row]
        cell.configure(person: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapOnCell(index: indexPath.row)
    }
}
