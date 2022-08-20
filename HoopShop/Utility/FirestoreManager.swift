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
    
    init() {
        fetchCategory()
        fetchAllCategories()
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
                    self.ctg_arr = querySnapshot!.documents.map{ d in
                        return Category(id: d["id"] as? Int ?? 0, name: d["name"] as? String ?? "")
                    }
                }
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                }
            }
        }
    }
}
