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
//let sampleProduct = Product(
//    id: 1,
//    name: "sample product",
//    image: "no1_ball",
//    price: 999,
//    description: "The court is a canvas and the ball is your brush. Unlock the creativity of this beautiful game with the Spalding REACT TF-250 All Surface Basketball. Spalding’s iconic grip will have you in control of your game at all times. Whether it’s the behind-the-back pass you’ve been perfecting or the last second half court heave you’ve been practicing, the REACT TF-250 is ready to ball at all times. Its all surface performance composite cover guarantees that you’re set no matter when or where the game is. The game is calling. Answer the call with the Spalding REACT TF-250.",
//    color: [0, 0, 0],
//    productType: "ball"
//)
let sampleProduct = Product (
    id: 0,
    name: "",
    image: "sample",
    price: 0,
    description: "",
    color: [0, 0, 0],
    productType: ""
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
