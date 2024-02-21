//
//  Album.swift
//  ItunesTopOneHundred
//
//  Created by Anthony H on 4/22/21.
//

import Foundation

struct Album: Codable {

    let feed: Feed
    
}

struct Feed: Codable {

    let results: [Results]
}

struct Results: Codable {

    let name: String
    let artistName: String
    let releaseDate: String
    let mediaUrl : String
    let genres: [Genres]
    let url: String
}

extension Results {

    enum CodingKeys: String, CodingKey {
        case name
        case artistName
        case releaseDate
        case mediaUrl = "artworkUrl100"
        case genres
        case url

    }
}

struct Genres: Codable {

    let name: String
    let url: String
}
