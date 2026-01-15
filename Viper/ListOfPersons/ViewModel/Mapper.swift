//
//  Mapper.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
struct Mapper {
    func map(personEntity: PersonEntity) -> PersonCellModel {
        PersonCellModel(name: personEntity.name, address: personEntity.address)
    }
}
