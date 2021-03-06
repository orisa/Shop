//
//  Explore.swift
//  Shop
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//  Allows user explore different categories in the app

import SwiftUI

struct Explore: View {
    
    @State private var navBarHidden = false
    @EnvironmentObject var appData: AppData

    var body: some View {
        
        NavigationView {
            VStack {
                
                NavigationLink("Women", destination: ShopCategoryList(navBarHidden: $navBarHidden)
                )
                Text("Women")
                    .onTapGesture {
                        print("Tapping")
                        self.appData.tintColor = .red
                }
                    
                
                   
//                NavigationLink("Men", destination: ShopCategoryList())
//                NavigationLink("Girls", destination: ShopCategoryList())
//                NavigationLink("Boys", destination: ShopCategoryList())
                Spacer()
            }
          
            .navigationBarTitle(navBarHidden ? "": "Explore", displayMode: .large)
            .onAppear {
                self.appData.tintColor = .brown
                self.navBarHidden = false
            }
        }
       // .accentColor(Color.black)
        .navigationBarColor(nil, tintColor: appData.tintColor, titleTextColor: .black)
        
        
        
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
            Explore()
    }
}

