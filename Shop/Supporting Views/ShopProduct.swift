//
//  ShopProduct.swift
//  Shop
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//

import SwiftUI

struct ShopProduct: View {
    
    var product: ShopItemViewModel
    
    var body: some View {
        GeometryReader { proxy in
            //VStack(alignment: .leading, spacing: (48/proxy.size.width) * 100) {
            VStack(alignment: .leading, spacing: proxy.size.width * 0.1) {

                VStack {
                    Image(self.product.imageName)
                    .resizable()
                    .scaledToFit()
                        .frame(width: proxy.size.width * 0.71)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.init(red: 53/255, green: 117/255, blue: 158/255))
                )
                VStack(alignment: .leading, spacing: proxy.size.width * 0.05) {
                    Text(self.product.name)
                    Text(self.product.price)
                        .font(.headline)
                }
              
            }
        }
    }
}

struct ShopProduct_Previews: PreviewProvider {
    static var previews: some View {
        ShopProduct(product: AppData().shopProducts[4])
            .frame(width: 150)
    }
}
