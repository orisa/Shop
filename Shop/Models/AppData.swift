//
//  AppData.swift
//  Shop
//
//  Created by Admin on 10/3/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//  Implements models used by app

import Foundation

// Data Models
struct ShopItem: Codable {
    
    var name: String
    var price: Double
    var imageName: String
    var id: String
    var category: Category
    var subcategory: SubCategory
    
    enum Category: String, Hashable, CaseIterable, Codable  {
        case women = "women"
        case men = "men"
    }
    
    enum SubCategory: String, Hashable, CaseIterable, Codable {
        case handbag = "hand bag"
        case jewellery = "jewellery"
        case footwear = "footwear"
        case dresses = "dresses"
    }
}

struct ShopItemViewModel: Identifiable {
    
    var shopItem: ShopItem
    
    var id: String {
        shopItem.id
    }
    
    var name: String {
        shopItem.name.capitalized
    }
    
    var price: String {
        
        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .currency
        return priceFormatter.string(from: NSNumber(value: shopItem.price)) ?? "N/A"
    }
    
    var imageName: String {
        shopItem.imageName
    }
}

class AppData: ObservableObject {
     
    @Published var selectedCategory: ShopItem.Category
    @Published var selectedSubCategory: ShopItem.SubCategory
    @Published var shopProducts: [ShopItemViewModel] = [] // producated of selected subcategory
    
    init() {
        selectedCategory = .women
        selectedSubCategory = .handbag
       
    }
    
}
