//
//  PersonDetailView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation

protocol PersonDetailViewProtocol: AnyObject {
    func displayPersonDetail(viewModel: PersonDetailViewModel)
}

protocol PersonDetailPresenterProtocol: AnyObject {
    var ui: PersonDetailViewProtocol? { get }
    var personId: String { get }
    func onViewAppear()
}


class PersonDetailPresenter: PersonDetailPresenterProtocol {
    weak var ui: PersonDetailViewProtocol?
    var personId: String
    
    private let interactor: PersonDetailInteractorProtocol
    
    init(personId: String, interactor: PersonDetailInteractorProtocol){
        self.personId = personId
        self.interactor = interactor
    }
    
    func onViewAppear() {
        let model = interactor.getPersonById(id: personId)
        let personDetailViewModel = PersonDetailViewModel(surname: model.surname)
        ui?.displayPersonDetail(viewModel: personDetailViewModel)
    }
}
