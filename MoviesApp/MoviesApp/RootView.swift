//
//  TabView.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import SwiftUI

struct RootView: View {
    @ObservedObject private var model: MoviesListModel = MoviesListModel()
    
    @State private var selection: Tab = .MOVIES_LIST
    
    init(){
        Logger.log(.initizialized, "RootView")
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MoviesListView()
                .environmentObject(model)
                .tag(Tab.MOVIES_LIST)
                .tabItem {
                    Label("All Movies", systemImage: "list.bullet")
                }
            
            Text("Favs")
                .environmentObject(model)
                .tag(Tab.FAVS)
                .tabItem {
                    Label("Favorites", systemImage: "suit.heart.fill")
                }
        }
        .onChange(of: self.selection) { newValue in
            print("New selection --> \(newValue)")
        }
    }
}

private enum Tab{
    case MOVIES_LIST
    case FAVS
}

/*
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
 */
