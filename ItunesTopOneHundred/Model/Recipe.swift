//
//  Recipe.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/28/21.
//

import Foundation

struct Recipe: Codable {
    let id: Int
    let title: String
}

typealias Welcome = [Recipe]

