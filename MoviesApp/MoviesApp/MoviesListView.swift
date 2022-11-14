//
//  MoviesList.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import SwiftUI

struct MoviesListView: View {
    @EnvironmentObject private var model: MoviesListModel
    @State private var showSheet: Bool = false
    private var moviesRes: Resource<[Movie]>{
        get{
            self.model.moviesRes
        }
    }
    
    init(){
        Logger.log(.initizialized, "MoviesListView")
    }
    
    var body: some View {
        NavigationView{
            Group{
                switch moviesRes.state {
                case .SUCCESS:
                    self.successView
                case .LOADING:
                    self.loadingView
                case .ERROR:
                    self.errorView
                case .READY:
                    self.readyView
                }
            }
            .transaction({ tran in
                tran.animation = .spring()
            })
            .navigationTitle("All Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Toggle Sheet to \(self.showSheet ? "False" : "True" )") {
                        self.showSheet.toggle()
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    var successView: some View{
        Group{
            if let movies = moviesRes.data {
                List(movies, id: \.imdbID){ movie in
                    
                    if showSheet {
                        SheetLink {
                            MovieDetailView(movie: movie){
                                self.model.favFor(movie: movie)
                            }
                        } onDismiss: {
                            Logger.log(.action, "Sheet for Movie dissmissed")
                        } label: {
                            MovieItemView(movie: movie)
                        }

                    }
                    else{
                        NavigationLink {
                            MovieDetailView(movie: movie){
                                self.model.favFor(movie: movie)
                            }
                        } label: {
                            MovieItemView(movie: movie)
                        }
                    }
                }
                .listStyle(.plain)
            }
            else{
                VStack{
                    Text("There are no movies ;(")
                        .font(.headline)
                    self.readyView
                }
            }
        }
    }
    
    var loadingView: some View{
        ProgressView()
    }
    
    var errorView: some View{
        VStack{
            Text(moviesRes.userErrorMsg)
                .font(.system(.headline))
                .foregroundColor(.red)
            
            self.readyView
        }
    }
    
    var readyView: some View{
        Button {
            self.fetchMovies()
        } label: {
            Text("Fetch Movies")
        }

    }
    
    private func fetchMovies(){
        model.fetchMovies()
    }
}

extension View {
    func animate(using animation: Animation = .easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
