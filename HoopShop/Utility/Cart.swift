//
//  Cart.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import Foundation

struct CartProduct: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    
    init(product: Product, count: Int) {
        self.id = UUID().uuidString
        self.product = product
        self.count = count
    }
}

// To compare CartProduct for removal
extension CartProduct : Equatable {
    static func == (lhs: CartProduct, rhs: CartProduct) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
}

class Cart: ObservableObject {
    @Published var cartItems: [CartProduct] = []
    @Published var showingCart: Bool = false
    
    var count = 0
    var countTotal = 0
    var subtotal = 0.0
    var addNewProduct = true
    
    func addProduct(product: Product){
        let price = Double(product.price)
        subtotal += price
        subtotal *= Double(count)
        
        var addNewProduct = true
        for (index, item) in cartItems.enumerated() {
            if item.product.id == product.id {
                cartItems[index].count = cartItems[index].count + self.count
                self.countTotal += self.count
                addNewProduct = false
            }
        }
        if addNewProduct {
            cartItems.append(CartProduct(product: product, count: self.count))
            self.countTotal += self.count
        }
        
        count = 0
    }
    
    func removeProduct(product: CartProduct) {
        self.countTotal -= product.count
        subtotal -= Double(product.product.price * product.count)
        cartItems.removeAll(where: { $0 == product })
    }
}
