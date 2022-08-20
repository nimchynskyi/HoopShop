//
//  FirestoreManager.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 20/08/2022.
//

import Foundation
import FirebaseFirestore

class FirestoreManager: ObservableObject {
    @Published var ctg: String = ""
    @Published var ctg_arr = [Category]()
    @Published var products_arr = [Product]()
    
    init() {
        fetchCategory()
        fetchAllCategories()
        fetchBalls()
    }
    
    func fetchCategory() {
        let db = Firestore.firestore()
        
        let docRef = db.collection("category").document("ctg-balls")
        
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.ctg = data["name"] as? String ?? ""
                }
            }
        }
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
}
