//
//  BallsView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct BallsView: View {
    @EnvironmentObject var shop: Shop
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        TitleView(title: "Balls")
        LazyVGrid(columns: gridLayout, spacing: 15,content: {
            ForEach(firestoreManager.products_arr) { product in
                if product.productType == "ball" {
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

struct BallsView_Previews: PreviewProvider {
    static var previews: some View {
        BallsView()
            .environmentObject(Shop())
            .environmentObject(FirestoreManager())
    }
}
