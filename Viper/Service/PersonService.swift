//
//  PersonService.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation

class PersonService {
    static let shared: PersonService = .init()
    init() {}
    
    func fetchPersonResponseEntity() -> PersonResponseEntity {
        let personList = (1...10).map{ i in
            PersonEntity(name:"Name \(i)", age: i, address: "Address \(i)", job: "Job \(i)")
        }
        return PersonResponseEntity(result: personList)
    }
    
    func fetchPersonDetailEntity(id: String) -> PersonDetailEntity {
        PersonDetailEntity(surname: "surname\(id)", email: "email@example.com", phone: 001020304, salary: 40000)
    }
    
}
