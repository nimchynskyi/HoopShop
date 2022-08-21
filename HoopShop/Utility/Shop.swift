//
//  Shop.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 17/08/2022.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var showBalls: Bool = true
    @Published var showShoes: Bool = false
    @Published var selectedProduct: Product? = nil
}
