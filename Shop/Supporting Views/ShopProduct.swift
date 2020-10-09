//
//  ShopProduct.swift
//  Shop
//
//  Created by Admin on 10/4/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//

import SwiftUI


struct ContentSize: PreferenceKey {
    
    typealias Value = CGSize
    static var defaultValue: Value = .zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct ShopProduct: View {
    
    var product: ShopItemViewModel
    @State private var size: CGSize = CGSize.zero
    
    var body: some View {
        
            GeometryReader { proxy in

                VStack(alignment: .leading, spacing: proxy.size.height * 0.08) {
                    VStack {
                        Text("Hello")
//                        Image(self.product.imageName)
//                        .resizable()
//                        .scaledToFit()
//                            .frame(width: proxy.size.width * 0.71)
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    //.frame(height: proxy.size.height * 0.75)
                    .frame(height: 165)

                    .background(
                        RoundedRectangle(cornerRadius: proxy.size.width * 0.1)
                            .fill(Color.init(red: 53/255, green: 117/255, blue: 158/255))
                    )
                    
                    VStack(alignment: .leading, spacing: proxy.size.height * 0.03) {
                        Text(self.product.name)
                        Text(self.product.price)
                            .font(.headline)
                        Text("\(self.size.height)")
                    }
                }
                .preference(key: ContentSize.self, value: proxy.size)
               
                     
              
            }
            .onPreferenceChange(ContentSize.self, perform: { value in
              print(value)
        })
        
        
      

    }
}

struct ShopProduct_Previews: PreviewProvider {
    static var previews: some View {
        ShopProduct(product: AppData().shopProducts[4])
          
            
    }
}
