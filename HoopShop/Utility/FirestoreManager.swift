//
//  FirestoreManager.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 20/08/2022.
//

import SwiftUI
import Foundation
import FirebaseFirestore
import FirebaseStorage

class FirestoreManager: ObservableObject {
    @Published var ctg_arr = [Category]()
    @Published var products_arr = [Product]()
    @Published var orders_arr = [CartProduct]()
    @Published var imageURL : URL?
    
    init() {
        fetchAllCategories()
        fetchAllProducts()
        fetchOrders()
    }
    
    func fetchAllCategories() {
        let db = Firestore.firestore()
        
        db.collection("category").order(by: "id").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                DispatchQueue.main.async {
                    self.ctg_arr = querySnapshot!.documents.map{ item in
                        return Category(id: item["id"] as? Int ?? 0, name: item["name"] as? String ?? "")
                    }
                }
            }
        }
    }
    
    func fetchAllProducts() {
        let db = Firestore.firestore()
        
        db.collection("products").addSnapshotListener{ (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                DispatchQueue.main.async {
                    self.products_arr = querySnapshot!.documents.map{ item in
                        return Product(
                            id: item["id"] as? Int ?? 0,
                            name: item["name"] as? String ?? "",
                            image: item["image"] as? String ?? "",
                            price: item["price"] as? Int ?? 0,
                            description: item["description"] as? String ?? "",
                            color: item["color"] as? [Double] ?? [],
                            productType: item["productType"] as? String ?? ""
                        )
                    }
                }
            }
        }
    }
    
    
    
    func fetchOrders() {
        let db = Firestore.firestore()

        db.collection("orders").addSnapshotListener{ (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                DispatchQueue.main.async {
                    self.orders_arr = querySnapshot!.documents.map{item in
                        return CartProduct(
                            id: item["id"] as? Int ?? 0,
                            name: item["name"] as? String ?? "",
                            image: item["image"] as? String ?? "",
                            price: item["price"] as? Int ?? 0,
                            description: item["description"] as? String ?? "",
                            count: item["count"] as? Int ?? 0
                        )
                    }
                }
            }
        }
    }
    
    func getURL(path: String) {
        let storage = Storage.storage()
        storage.reference().child("images/" + path).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                return
            }
            self.imageURL = url
        })
    }
}
