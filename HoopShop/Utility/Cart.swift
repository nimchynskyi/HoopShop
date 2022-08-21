//
//  Cart.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import Foundation

struct CartProduct: Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    
    var formattedPrice: String {
        if price == 0 {
            return ""
        } else {
            return "$\(price)"
        }
    }
}

class Cart: ObservableObject {
    @Published var test: String = "EnvTest"
    @Published var showingCart: Bool = false
    @Published var cartItems: [Product] = []
}
