//
//  Cart.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import Foundation
import FirebaseFirestore

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
    
    // Display order
    var count = 0
    var countTotal = 0
    var subtotal = 0.0
    var addNewProduct = true
    
    func addProduct(product: Product){
        subtotal += Double(count * product.price)
        
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
    
    func makeOrder() {
        let orderNumber = Int.random(in: 100000...999999)
        let orderName: String = "order_no" + String(orderNumber)
        
        var order = [String: Any]()
        var orderItems = ""
        for item in cartItems {
            orderItems += (item.product.name + " x" + String(item.count) + "($" + String(item.product.price * item.count) + "); ")
        }
        
        order["orderId"] = UUID().uuidString
        order["orderItems"] = orderItems
        order["orderPrice"] = subtotal
        
        let db = Firestore.firestore()
        let docRef = db.collection("orders").document(orderName)
        
        // Order data
        docRef.setData(order) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
        
        // Timestamp
        docRef.updateData(["orderDate": FieldValue.serverTimestamp(),]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated!")
            }
        }
        
        // Clear cart and order data
        cartItems.removeAll()
        order.removeAll()
        self.count = 0
        self.countTotal = 0
        self.subtotal = 0.0
    }
}
