//
//  TestData.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import Foundation

struct TestData {
    static var movies: [Movie] = {
        let url = Bundle.main.url(forResource: "movies", withExtension:
        "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode([Movie].self, from: data)
    }()
}
