//
//  ShopDetail.swift
//  Shop
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//

import SwiftUI

struct ShopDetail: View {
    
    @Binding var categoryLinkActive: Bool
    @ObservedObject var listData: ListData
    
    var body: some View {
        VStack {
            Button(action: {
                self.categoryLinkActive = false
            }, label: {
                 Image(systemName: "chevron.left")
            })
          
            Text("Hello, World!")
        }
       // .navigationBarColor(.yellow, tintColor: .black)
        .navigationBarTitle("Detail", displayMode: .large)
        .onAppear {
            print(self.listData.navbarTitleHidden)
            self.listData.navbarTitleHidden = true
        }
       
      
      
    }
}

struct ShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetail(categoryLinkActive: .constant(false), listData: ListData())
    }
}
