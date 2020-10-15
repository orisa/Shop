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
    @EnvironmentObject var appData: AppData
    
    var product: ShopItemViewModel
    
    var body: some View {
        GeometryReader { proxy in
             
                ZStack(alignment: .bottom) {
                    Color(self.product.imageName)
                    DetailTopsection(price: self.product.price,
                                         imageName: self.product.imageName,
                                          size: CGSize(width: 375, height: 461
                                    )
                        
                        
                    )
                    .zIndex(1)
                   
                    DetailBottomsection(product: self.product, size:  CGSize(width: 375, height: 461), btnColor: .red)
                         
                       
                        
                    
                }
                .navigationBarTitle(
                    Text(self.product.name),
                    displayMode: .large
                )
                .onAppear {
                    print(self.listData.navbarTitleHidden)
                    self.listData.navbarTitleHidden = true
                   
                    print("updating tintcolor")
                }
                
 
        }
        .navigationBarColor(
            UIColor(named: self.product.imageName)
        )
    }
}

struct ShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                       ShopDetail(categoryLinkActive: .constant(false), listData: ListData(), product: AppData().shopProducts[0])
                            .environmentObject(AppData())
                   }
        }
       
//        DetailBottomsection(product: AppData().shopProducts[0], size: CGSize(width: 375, height: 461), btnColor: .red)
//            .previewLayout(.sizeThatFits)
        
//        DetailTopsection(price: AppData().shopProducts[0].price,
//                         imageName: AppData().shopProducts[0].imageName,
//                         size: CGSize(width: 375, height: 461)
//                         )
//            .previewLayout(.sizeThatFits)

    }
}

struct DetailTopsection: View {
    
    let price: String
    let imageName: String
    let size: CGSize
     
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Price")
                    Text("\(price)")
                        .font(.title)
                }
                .foregroundColor(Color(.black))
                Spacer()
                Image(imageName)
                .resizable()
                //.scaledToFill()
                    .frame(width: 172, height: 172)
                    .offset(x: 0, y: 96)
                   
            }
            Spacer()
            //.frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding(.horizontal, 16)
        .padding(.trailing, 32)
    }
}

struct DetailBottomsection: View {
    
    @State private var selectedColor = Color.yellow
    @State private var count = 0
    @State private var isFavorited = false
     @State private var isCarted = false
    
    var product: ShopItemViewModel
    let colors = [Color.blue, Color.gray, Color.yellow]
    let size: CGSize
    let btnColor: Color
    
  
     
    var body: some View {
        VStack(spacing: 32) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Color")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack {
                        ForEach(colors, id: \.self) { color in // debug print
                            Circle().fill(color)
                            .frame(width: 16, height: 16)
                            .padding(4)
                            .overlay(
                                Circle()
                                    .stroke(color == self.selectedColor ? color : Color.clear, lineWidth: 1)
                            )
                        }
                    }
                  
                }
                .frame(minWidth: 0, maxWidth: size.width, alignment: .leading)
              
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Size")
                      .font(.subheadline)
                       .foregroundColor(.gray)
                    Text("\(product.size) cm")
                    
                }
                 .frame(minWidth: 0, maxWidth: size.width, alignment: .leading)
                
            }
            
            // controls
            ScrollView {
                Group {
                    Text(product.description)
                        .font(.body)
                    VStack(spacing: 16) {
                        HStack {
                            HStack(spacing: 16) {
                                Text("\(count) Quantity")
                                Stepper("", value: $count)
                                    .labelsHidden()
                            }
                            Spacer()
                            Button(action: {
                                self.isFavorited.toggle()
                            }, label: {
                                Image(systemName: isFavorited ? "heart.fill" : "heart")
                                     
                                    .foregroundColor(isFavorited ? .red : Color(product.imageName))
                                    .padding(8)
                            })
                                .buttonStyle(PlainButtonStyle())
                                .background(
                                    Circle()
                                        .stroke(Color(product.imageName))
                            )
                            
                            
                        }
                        HStack {
                            Button(action: {
                                self.isCarted.toggle()
                            }, label: {
                                Image(systemName: isCarted ? "cart.fill": "cart.badge.plus")
                                    .foregroundColor(Color(product.imageName))
                                    .padding(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(product.imageName))
                                )
                            })
                                .buttonStyle(PlainButtonStyle())
                            Spacer()
                            Button(action:  {
                                
                            }, label: {
                                Text("BUY NOW")
                                    .foregroundColor(.white)
                                    .font(.callout)
                                    .frame(width: 196, height: 36)
                                
                            })
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(product.imageName))
                            )
                        }
                        
                    }
                }
                 .padding(.horizontal, 16)
              
                 
            }
            .padding(.horizontal, -16)
           
           
        }
        .frame(height: 300)
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
        .background(
            RoundedCorner(radius: 30, corners: [.topLeft, .topRight])
                .fill(Color.white)
        )
    }
}
