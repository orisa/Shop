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
      //  DetailBottomsection(product: appData.shopProducts[0])
            
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
    var titleTextColor: UIColor?
    
    init( backgroundColor: UIColor? , tintColor: UIColor? = .black, titleTextColor: UIColor? = .black) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleTextColor ?? UIColor.red]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleTextColor ?? UIColor.blue]
        
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
 
    func navigationBarColor(_ backgroundColor: UIColor?, tintColor: UIColor? = .black, titleTextColor: UIColor? = .black) -> some View {
        print("nav bar")
        return self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, tintColor: tintColor, titleTextColor: titleTextColor))
    }

}

