//
//  MoviesListModel.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import Foundation
import SwiftUI

class MoviesListModel: ObservableObject{
    
    @Published var moviesRes = Resource<[Movie]>(TAG: "MoviesListModel.moviesRes")
    
    func fetchMovies(){
        self.moviesRes.update(state: .LOADING)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.moviesRes.update(state: .SUCCESS, data: TestData.movies)
        }
    }
    
    func favFor(movie: Movie){
        moviesRes.data?.indices.forEach({ index in
            if moviesRes.data?[index] == movie {
                moviesRes.data?[index].isFavorite.toggle()
            }
        })
    }
}

