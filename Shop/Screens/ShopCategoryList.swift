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
        GeometryReader { proxy in
            VStack {
                Group {
                    NavBar(category: self.appData.selectedCategoryTitle, size: proxy.size)
                    SubcategoryMenubar(subCategoryTitles: self.appData.subcategoryTitles,
                                       selectedSubCategory: self.appData.selectedSubcategoryTitle)
                        .padding(.bottom, 20)
                }
                 .padding(.horizontal, 20)
                CategoryProducts(products:self.appData.shopProducts, screenSize: proxy.size)
                   
            }
                
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
       // .edgesIgnoringSafeArea(.all)
    
      
    }
}

struct ShopCategoryList_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
//                       ShopCategoryList().environmentObject(AppData())
//                   }
        
        Group {
           NavBar(category: "Women", size: CGSize(width: 360, height: 570))
 //            SubcategoryMenubar(
//                        subCategoryTitles: ["Hand Bag", "Dresses", "Trousers", "Skirts"],
//                        selectedSubCategory: "Dresses")
//            GeometryReader { proxy in
//                CategoryProducts(products: AppData().shopProducts, screenSize: proxy.size)
//            }
           
           
            
            NavigationView {
                ShopCategoryList().environmentObject(AppData())
            }
        }
         .previewLayout(.sizeThatFits)
    }
}

struct NavBar: View {
    
    var category: String
    
    var size: CGSize
   
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .medium))
                }
                //.padding(10)
                .frame(minWidth: 0, maxWidth: size.width * 0.5, alignment: .leading)
               .frame(height: 44, alignment: .leading)
                
                Spacer()
                HStack {
                    Image(systemName: "textformat.size")
                                       .font(.system(size: 22, weight: .light))
                                       .padding(11)
                }
                .frame(minWidth: 0, maxWidth: size.width * 0.5, alignment: .trailing)
                .frame(height: 44)
                
             }
            Text(category)
                .font(.largeTitle)
               //  .padding(.leading, 10)
                
         }
     }
}

struct SubcategoryMenubar: View {
    
    var subCategoryTitles: [String]
    @State var selectedSubCategory: String
   
    var body: some View {
       
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 48) {
                ForEach(subCategoryTitles, id: \.self) { subCategoryTitle in
                    Button(action: {
                        self.selectedSubCategory = subCategoryTitle
                    }, label: { Text(subCategoryTitle)}
                    )
                        .font(.headline)
                        .foregroundColor(
                            subCategoryTitle == self.selectedSubCategory ?
                                Color.black : Color.gray
                         )
                    //.fontWeight(.medium)
                }
            }
        }
        
    }
}

struct CategoryProducts: View {
    
    var products: [ShopItemViewModel]
  
    var screenSize: CGSize = CGSize(width: 320, height: 568)
    var rowHeight: CGFloat {
        0.32 * screenSize.height
     // 0.36 * screenSize.height
    }
    
    var gridSpacing: CGFloat {
       //20
       0.06 * screenSize.width
    }
   
    var body: some View {
        
          ScrollView {
        
            Grid(products) { product in
                 ShopProduct2(spacing: 0.08 * self.rowHeight,
                             topHeight: 0.70 * self.rowHeight,
                             bottomSpacing: 0.03 * self.rowHeight, product: product)
                 
            }
            .padding(.horizontal, gridSpacing)
            .gridStyle(
                ModularGridStyle(columns: 2, rows: .fixed(rowHeight), spacing: gridSpacing)
            )
        }
       // .padding(.horizontal, gridSpacing)
          .onAppear {
            print(self.screenSize)
        }
    }
}

