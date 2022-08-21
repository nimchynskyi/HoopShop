//
//  CartView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var shop: Shop
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var firestore: FirestoreManager
    @State private var isAnimated: Bool = false
    
    var body: some View {
        NavigationView {
            List (cart.cartItems) { cartItem in
                NavigationLink (destination: CartItemDetail(cartItem: cartItem)){
                    CartItemView(cartItem: cartItem)
                }.swipeActions {
                    Button(action: {
                        withAnimation{
                            cart.removeProduct(product: cartItem)
                        }
                    }, label: {
                        Text("Delete")
                    })
                    .tint(.red)
                }
            }
            .navigationTitle("My Cart")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        CartSummaryView()
        
        CartPaymentView()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(Shop())
            .environmentObject(Cart())
            .environmentObject(FirestoreManager())
    }
}
