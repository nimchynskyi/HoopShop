//
//  StorageManager.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage

class StorageManager: ObservableObject {
    let storage = Storage.storage()
    
    func listAllFiles() {
        // Create a reference
        let storageRef = storage.reference().child("images")
        
        // List all items in the images folder
        storageRef.listAll { (result, error) in
            if let error = error {
                print("Error while listing all files: ", error)
            }
            
            for item in result!.items {
                print("Item in images folder: ", item)
            }
        }
    }
    
}
