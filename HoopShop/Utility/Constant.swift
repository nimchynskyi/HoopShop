//
//  Constant.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase
import FirebaseStorage

// DATA
let featuredProducts: [FeaturedProduct] = Bundle.main.decode("featured.json")
let categories: [Category] = Bundle.main.decode("category.json")

// COLOR
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// LAYOUT

// UX

// API
let rootRef = Database.database().reference()
let categoryRef = rootRef.child("category")

let storage = Storage.storage()
let storageRef = storage.reference().child("images")

//categoryRef
//    .queryOrderedByKey()
//    .observeSingleEvent(of: .value, with: { snapshot in
//        let value = snapshot.value as? NSDictionary
//
//        let id = value?["id"] as? Int ?? ""
//        let image = value?["image"] as? String ?? ""
//        let name = value?["name"] as? String ?? ""
//
//        print("name: \(name!)")
//    })

// IMAGE

// FONT

// STRING

// MISC
