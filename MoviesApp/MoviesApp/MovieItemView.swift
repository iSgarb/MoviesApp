//
//  MovieItemView.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import SwiftUI

struct MovieItemView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack{
            // MARK: Movie Poster
            AsyncImage(
                url: URL(string: movie.poster)
            ){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75)
                        .cornerRadius(5)
                        .moviesShadow()
                } placeholder: {
                    ProgressView()
                }
                .padding(5)

            // MARK: Movie Data
            VStack(alignment: .leading){
                // MARK: TITLE
                HStack{
                    Text(movie.title)
                        .font(.system(.headline))
                    
                    Spacer()
                    
                    let favImgName = movie.isFavorite ? "suit.heart.fill" : "suit.heart"
                    
                    Image(systemName: favImgName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10)
                }
                
                // MARK: DIRECTOR
                Text(movie.director)
                    .font(.system(.subheadline))
                
                // MARK: TITLE & RUNTIME
                Group{
                    Text(movie.genre)
                    Text(movie.runtime)
                }
                .font(.system(.caption))
                .foregroundColor(.gray)
            }
            .lineLimit(1)
        }
    }
}

/*
struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView()
    }
}
 */
