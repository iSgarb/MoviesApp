//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    let onFav: (() -> Void)
    
    init(
        movie: Movie,
        onFav: @escaping (() -> Void)
    ){
        Logger.log(.initizialized, "MovieDetailView -> \(movie.title)")
        
        self.movie = movie
        self.onFav = onFav
    }
    
    var body: some View {
        ScrollView{
            VStack{
                // MARK: Poster & Info
                self.posterAndInfo
                
                // MARK: Director & Actors
                self.directorAndActors
                
                // MARK: PLOT
                Divider()
                Text(movie.plot)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                

            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
    
    var posterAndInfo: some View{
        HStack{
            AsyncImage(
                url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth * 0.35)
                        .cornerRadius(5)
                        .moviesShadow()
                } placeholder: {
                    ProgressView()
                }
                .padding(5)
            
            VStack(alignment: .leading, spacing: 10){
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 10){
                        Text("\(movie.year), \(movie.country)")
                        
                        Text(movie.genre)
                        
                        Text(movie.awards)
                    }
                    
                    Spacer()
                    
                    let favImgName = movie.isFavorite ? "suit.heart.fill" : "suit.heart"
                    
                    Button {
                        onFav()
                    } label: {
                        Image(systemName: favImgName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                }
                
                Spacer()
            }
            .font(.body)
            .foregroundColor(.gray)
        }
    }
    
    var directorAndActors: some View{
        VStack(alignment: .leading, spacing: 15){
            // Directed by
            self.secondaryInfo(
                desc: "Directed by",
                info: movie.director
            )
            
            // Actors by
            self.secondaryInfo(
                desc: "Actors",
                info: movie.actors
            )
        }
    }
    
    @ViewBuilder private func secondaryInfo(
        desc: String,
        info: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 3){
            Text(desc)
                .font(.caption)
                .foregroundColor(.gray)
            Text(info)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/*
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
 */
