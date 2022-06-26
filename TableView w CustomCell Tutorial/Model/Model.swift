//
//  Model.swift
//  TableView w CustomCell Tutorial
//
//  Created by Ömer Faruk Kılıçaslan on 26.06.2022.
//

import Foundation

// MARK: - Welcome
struct ResultList:Codable {
    let results: [Result]
}

// MARK: - Result
struct Result:Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location:Codable {
    let name: String?
    let url: String?
}
