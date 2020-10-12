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
        
      //  NavigationView {
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
           //.navigationBarColor(.green, tintColor: .brown)
               
               
             
      //  }
       
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    var tintColor: UIColor?
    
    init( backgroundColor: UIColor?, tintColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .red
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = tintColor
        

    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?, tintColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, tintColor: tintColor))
    }

}

