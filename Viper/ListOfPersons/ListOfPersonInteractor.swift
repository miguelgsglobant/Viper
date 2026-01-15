//
//  ListOfPersonView.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation

protocol ListOfPersonInteractorProtocol: AnyObject {
    func getPersonList() -> PersonResponseEntity
}

class ListOfPersonInteractor: ListOfPersonInteractorProtocol {
    
    func getPersonList() -> PersonResponseEntity {
//        let personList = (1...10).map{ i in
//            PersonEntity(name:"Name \(i)", age: i, address: "Address \(i)", job: "Job \(i)")
//        }
//        return PersonResponseEntity(result: personList)
        PersonService.shared.fetchPersonResponseEntity()
    }
}
