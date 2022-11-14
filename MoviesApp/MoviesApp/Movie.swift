//
//  Movie.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import Foundation

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let year: String
    let runtime: String
    let genre: String
    let director: String
    let actors: String
    let plot: String
    let country: String
    let awards: String
    let poster: String
    
    var isFavorite: Bool = false
}

extension Movie{
    enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
    }
}

extension Movie: Equatable{
    
}
