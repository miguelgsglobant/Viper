//
//  PersonDetailView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
protocol PersonDetailInteractorProtocol: AnyObject {
    func getPersonById(id: String) -> PersonDetailEntity
}

class PersonDetailInteractor: PersonDetailInteractorProtocol {
    func getPersonById(id: String) -> PersonDetailEntity {
        PersonService.shared.fetchPersonDetailEntity(id: id)
    }
}
