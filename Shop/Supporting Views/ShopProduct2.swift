//
//  ShopProduct2.swift
//  Shop
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//

import SwiftUI

struct ShopProduct2: View {
    
    var spacing: CGFloat = 0
    var topHeight: CGFloat = 165
    var bottomSpacing: CGFloat = 0
    let topCornerRadius: CGFloat = 10
    let topPadding: CGFloat = 24
    var product: ShopItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            VStack {
                
                Image(self.product.imageName)
                    .resizable()
                
            }
            .padding(topPadding)
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: topHeight)
            .background(
                RoundedRectangle(cornerRadius: topCornerRadius)
                    .fill(Color(product.imageName))
            )
            
            VStack(alignment: .leading, spacing: bottomSpacing) {
                Text(self.product.name)
                Text(self.product.price)
                    .font(.headline)
//                Text("Heill")
            }
        }
    }
}

struct ShopProduct2_Previews: PreviewProvider {
    static var previews: some View {
        ShopProduct2(product: AppData().shopProducts[4])
              .frame(width: 150, height: 260)
    }
}
