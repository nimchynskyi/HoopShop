//
//  Constant.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase

// DATA
let featuredProducts: [FeaturedProduct] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")

// COLOR
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10

// UX

// API
let rootRef = Database.database().reference()
let categoryRef = rootRef.child("category")

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
