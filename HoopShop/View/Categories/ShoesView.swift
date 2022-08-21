//
//  ShoesView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct ShoesView: View {
    @EnvironmentObject var shop: Shop
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        TitleView(title: "Shoes")
        LazyVGrid(columns: gridLayout, spacing: 15,content: {
            ForEach(firestoreManager.products_arr) { product in
                if product.productType == "shoes" {
                    ProductItemView(product: product)
                        .onTapGesture {
                            feedback.impactOccurred()
                            withAnimation(.easeOut) {
                                shop.selectedProduct = product
                                shop.showingProduct = true
                            }
                        }
                }
            }//: LOOP
        })//: GRID
        .padding(15)
    }
}

struct ShoesView_Previews: PreviewProvider {
    static var previews: some View {
        ShoesView()
            .environmentObject(Shop())
            .environmentObject(FirestoreManager())
    }
}
