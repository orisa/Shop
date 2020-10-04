//
//  ShopCategoryList.swift
//  Shop
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//

import SwiftUI

struct ShopCategoryList: View {
    
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            NavBar()
            Text("CategoryTitle")
            SubcategoryMenubar()
            CategoryProducts()
        }
        //.navigationBarTitle(Text(appData.selectedCategory.rawValue))
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct ShopCategoryList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShopCategoryList().environmentObject(AppData())
        }
    }
}

struct NavBar: View {
   
    var body: some View {
        HStack {
        
            Text("Navbar")
        }
    }
}

struct SubcategoryMenubar: View {
   
    var body: some View {
       
            Text("Subcategory")
        
    }
}

struct CategoryProducts: View {
   
    var body: some View {
        Text("Category Products")
    }
}

