//
//  ContentView.swift
//  Shop
//
//  Created by Admin on 10/3/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        
       // NavigationView {
            TabView(content: {
                Explore()
                    .tabItem({
                        Image(systemName: "viewfinder")
                        Text("explore")
                    })
                Text("Search")
                    .tabItem({
                        Image(systemName: "magnifyingglass")
                        Text("search")
                    })
                Text("Cart")
                    .tabItem({
                        Image(systemName: "cart")
                        Text("cart")
                    })
                Text("Favorite")
                    .tabItem({
                        Image(systemName: "heart")
                        Text("heart")
                    })
            })
       // }
       
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
