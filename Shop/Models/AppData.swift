//
//  AppData.swift
//  Shop
//
//  Created by Admin on 10/3/20.
//  Copyright © 2020 rapid interactive. All rights reserved.
//  Implements models used by app

import Foundation
import UIKit

// Data Models
typealias Category = ShopItem.Category
typealias SubCategory = ShopItem.SubCategory

struct ShopItem: Codable {
    
    var name: String
    var price: Double
    var imageName: String
    var id: String
    var category: Category
    var subcategory: SubCategory
    var description: String
    var size: Double
    
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
        priceFormatter.roundingMode = .floor
        return priceFormatter.string(from: NSNumber(value: shopItem.price)) ?? "N/A"
    }
    
    var imageName: String {
        shopItem.imageName
    }
    
    var size: String {
        return String(shopItem.size)
    }
    
    var description: String {
        return shopItem.description
    }
}

class AppData: ObservableObject {
     
    @Published var selectedCategory: ShopItem.Category = .women
    @Published var selectedSubCategory: ShopItem.SubCategory = .dresses
    @Published var shopProducts: [ShopItemViewModel] = [] // producated of selected subcategory
    @Published var tintColor: UIColor? = UIColor.black
    
    let filename = "shop"
    let ext = "json"
    var manager: FileManager
    
    var selectedCategoryTitle: String {
        selectedCategory.rawValue.capitalized
    }
    
    var selectedSubcategoryTitle: String {
        selectedSubCategory.rawValue.capitalized
    }
       
    
    var subcategoryTitles: [String] {
        SubCategory.allCases.map({$0.rawValue.capitalized})
    }
    
    init() {
        selectedCategory = .women
        selectedSubCategory = .handbag
        manager = FileManager.default
        shopProducts = load().map({ShopItemViewModel(shopItem: $0)})
        print(shopProducts)
        
    }
    
    
    
    func load() -> [ShopItem] {
        
        // get path of that points to resource file in bundle
        let bundle = Bundle.main
        guard let filePath = bundle.path(forResource: filename, ofType: ext) else {
            fatalError("Cannot locate file \(filename).\(ext)")
        }
        
        // load contents of file at path
        guard let shopData = manager.contents(atPath: filePath) else {
            fatalError("Cannot load contents file \(filename).\(ext)")
        }
        
        // parse loaded data
        do {
             let shopItems = try JSONDecoder().decode([ShopItem].self, from: shopData)
             return shopItems
        } catch {
             fatalError("Cannot parse contents file \(filename).\(ext)")
        }
       
    }
    
}
