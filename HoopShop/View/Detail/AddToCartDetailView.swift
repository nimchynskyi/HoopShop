//
//  AddToCartDetailView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 17/08/2022.
//

import SwiftUI

struct AddToCartDetailView: View {
    // MARK: - Property
    @EnvironmentObject var shop: Shop
    @EnvironmentObject var cart: Cart
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            if cart.count != 0 {
                cart.addProduct(product: shop.selectedProduct ?? sampleProduct)
            }
            feedback.impactOccurred()
        }, label: {
            Spacer()
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        })
        .padding(15)
        .background(
            Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                green: shop.selectedProduct?.green ?? sampleProduct.green,
                blue: shop.selectedProduct?.blue ?? sampleProduct.blue
            )
        )
        .clipShape(Capsule())
    }
}

// MARK: - Preview
struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .environmentObject(Shop())
            .environmentObject(Cart())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
