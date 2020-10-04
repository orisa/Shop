//
//  ShopCategoryList.swift
//  Shop
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//  Displays products for selected subcategory of selected category

import SwiftUI

struct ShopCategoryList: View {
    
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            NavBar()
            Text("CategoryTitle")
            SubcategoryMenubar()
            CategoryProducts(products: [])
        }
        //.navigationBarTitle(Text(appData.selectedCategory.rawValue))
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct ShopCategoryList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryProducts(products: AppData().shopProducts)
                .previewLayout(.sizeThatFits)
//            NavigationView {
//                ShopCategoryList().environmentObject(AppData())
//            }
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
    
    var products: [ShopItemViewModel]
   
    var body: some View {
        ScrollView {
            Text("Category Products")
        }
    }
}

