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
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink("Women", destination: ShopCategoryList(navBarHidden: $navBarHidden))
                   
//                NavigationLink("Men", destination: ShopCategoryList())
//                NavigationLink("Girls", destination: ShopCategoryList())
//                NavigationLink("Boys", destination: ShopCategoryList())
                Spacer()
            }
            .navigationBarTitle(navBarHidden ? "": "Explore", displayMode: .large)
           

            .onAppear {
                self.navBarHidden = false
            }
          
            
        }
         
      
       
     
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
         
            Explore()
        
    }
}

