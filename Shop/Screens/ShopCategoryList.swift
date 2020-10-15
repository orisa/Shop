//
//  ShopCategoryList.swift
//  Shop
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//  Displays products for selected subcategory of selected category

import SwiftUI

class ListData: ObservableObject {
    @Published var navbarTitleHidden = false
}

struct ShopCategoryList: View {
    
    @EnvironmentObject var appData: AppData
    @Binding var navBarHidden: Bool
    @State var navBarTitle = "Women"
    @ObservedObject var listData = ListData()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Group {
                     
                    SubcategoryMenubar(subCategoryTitles: self.appData.subcategoryTitles,
                                       selectedSubCategory: self.appData.selectedSubcategoryTitle)
                     
                }
                 .padding(.horizontal, 20)
              
                CategoryProducts(products:self.appData.shopProducts,
                                 screenSize: proxy.size, listData: self.listData)
                    
                   
                Spacer()
            }
            
        }
         .navigationBarTitle(listData.navbarTitleHidden ? "": "Women", displayMode: .automatic)
        .navigationBarItems(trailing:
            Image(systemName: "textformat.size")
                .font(.system(size: 32, weight: .medium))
        )
        .onAppear {
            self.navBarHidden = true
            self.listData.navbarTitleHidden = false
        }
      
    }
}

struct ShopCategoryList_Previews: PreviewProvider {
    static var previews: some View {
 
        
        Group {
           NavBar(category: "Women", size: CGSize(width: 360, height: 570))
 //            SubcategoryMenubar(
//                        subCategoryTitles: ["Hand Bag", "Dresses", "Trousers", "Skirts"],
//                        selectedSubCategory: "Dresses")
//            GeometryReader { proxy in
//                CategoryProducts(products: AppData().shopProducts, screenSize: proxy.size)
//            }
           
           
            
            NavigationView {
                ShopCategoryList(navBarHidden: .constant(false)).environmentObject(AppData())
                  
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
                   
                }
            }
        }
        
    }
}

struct CategoryProducts: View {
    
    var products: [ShopItemViewModel]
    @State var categoryLinkActive = false
    @State var selectedPdt: ShopItemViewModel?
    @State var pdtId: String?
  
  
    var screenSize: CGSize = CGSize(width: 320, height: 568)
      @ObservedObject var listData: ListData
    var rowHeight: CGFloat {
        0.4 * screenSize.height
     // 0.36 * screenSize.height
    }
    
    var gridSpacing: CGFloat {
       //20
       0.06 * screenSize.width
    }
   
    var body: some View {
        
          return ScrollView {
            
            selectedPdt.map{
                NavigationLink(destination:  ShopDetail(categoryLinkActive: .constant(false),
                                listData: listData, product: $0),
                               tag: $0.id, selection: self.$pdtId, label: {
                    EmptyView()
                })
            }
        
             Grid(products) { product in
                ShopProduct2(
                                spacing: 0.08 * self.rowHeight,
                                topHeight: 0.7 * self.rowHeight,
                                bottomSpacing: 0.03 * self.rowHeight, product: product
                             )
                  //  .padding(.top, 52)
                .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedPdt = product
                        self.pdtId = product.id
                }
             
                 
            }
            .padding(.horizontal, gridSpacing)
            .padding(.top, 32)
            .gridStyle(
                ModularGridStyle(columns: 2, rows: .fixed(rowHeight), spacing: gridSpacing)
            )
        }
        
    }
}

