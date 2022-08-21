//
//  ProductModel.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 16/08/2022.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
    let color: [Double]
    let productType: String
    
    var red: Double { return color[0] }
    var green: Double { return color[1] }
    var blue: Double { return color[2] }
    
    
    var formattedPrice: String {
        if price == 0 {
            return ""
        } else {
            return "$\(price)"
        }
    }
}


