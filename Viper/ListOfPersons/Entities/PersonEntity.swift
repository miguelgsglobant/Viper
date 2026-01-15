//
//  PersonEntity.swift
//  Viper
//
//  Created by Miguel angel Garcia Sanchez on 18/12/25.
//

import Foundation
struct PersonEntity: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
    var address: String
    var job: String
}
