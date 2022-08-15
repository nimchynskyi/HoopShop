//
//  CategoryModel.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import Foundation
import FirebaseFirestore

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}

class CategoryModel: ObservableObject {
    @Published var categories = [Category]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("category").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.categories = documents.map { queryDocumentSnapshot -> Category in
                let data = queryDocumentSnapshot.data()
                
                let id = data["id"] as? Int ?? 0
                let name = data["name"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                
                return Category(id: id, name: name, image: image)
            }
        }
    }
}
