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
    @Published var imageURL : URL?
    
    init() {
        fetchAllCategories()
        fetchBalls()
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
    
    func fetchBalls() {
        let db = Firestore.firestore()
        
        db.collection("products").whereField("productType", isEqualTo: "ball").addSnapshotListener{ (querySnapshot, error) in
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
                            color: item["color"] as? [Double] ?? []
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
