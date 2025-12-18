//
//  PersonDetailView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
import UIKit

class PersonDetailViewController: UIViewController {
    let personDetailView = PersonDetailView()
    private let presenter: PersonDetailPresenterProtocol
    
    init(presenter: PersonDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = personDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewAppear()
    }
}

extension PersonDetailViewController: PersonDetailViewProtocol{
    func displayPersonDetail(viewModel: PersonDetailViewModel) {
        personDetailView.surnameLabel.text = viewModel.surname
    }
    
    
}
