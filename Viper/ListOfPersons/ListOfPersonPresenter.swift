//
//  ListOfPersonView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation

protocol ListOfPersonViewProtocol: AnyObject {
    func updateView(modelView: [PersonCellModel])
}

protocol ListOfPersonPresenterProtocol: AnyObject {
    var ui: ListOfPersonViewProtocol? { get }
    var personCellModelList: [PersonCellModel] { get }
    func onViewApper()
    func onTapOnCell(index: Int)
}

class ListOfPersonPresenter: ListOfPersonPresenterProtocol {
    
    weak var ui: ListOfPersonViewProtocol?
    var personCellModelList: [PersonCellModel] = []
    
    private let interactor: ListOfPersonInteractorProtocol
    private let mapper: Mapper
    
    private var models: [PersonEntity] = []
    
    private let router: ListOfPersonRouterProtocol
    
    init(interactor: ListOfPersonInteractorProtocol, mapper: Mapper = Mapper(), router: ListOfPersonRouterProtocol){
        self.interactor = interactor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewApper() {
        models = interactor.getPersonList().result
        let persons = models.map{
            mapper.map(personEntity: $0)
        }
        personCellModelList = persons
        ui?.updateView(modelView: persons)
    }
    
    func onTapOnCell(index: Int) {
        let personId = models[index].id
        print(personId)
        router.showPersonDetail(personId: index.description)
    }
    
}
