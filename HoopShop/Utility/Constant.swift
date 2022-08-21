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
//let categories: [Category] = Bundle.main.decode("category.json")
//let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let sampleProduct = Product(
    id: 1,
    name: "",
    image: "",
    price: 0,
    description: "",
    color: [0, 0, 0]
)
let sampleOrder = CartProduct(
    product: sampleProduct,
    count: 0
)

// COLOR
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)

// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array (repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// UX
let feedback = UIImpactFeedbackGenerator(style: .medium)

// API

// IMAGE

// FONT

// STRING

// MISC
