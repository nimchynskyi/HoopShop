//
//  NavigationBarDetailView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 17/08/2022.
//

import SwiftUI

struct NavigationBarDetailView: View {
    // MARK: - Property
    @EnvironmentObject var shop: Shop
    @EnvironmentObject var cart: Cart
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button(action: {
                feedback.impactOccurred()
                withAnimation(.easeIn) {
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })
            
            Spacer()
            
            Button(action: {
                feedback.impactOccurred()
                cart.showingCart.toggle()
            }, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                    if cart.count != 0 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 14, height: 14, alignment: .center)
                            .offset(x: 13, y: -10)
                    }
                }
            }).sheet(isPresented: $cart.showingCart) {
                CartView()
            }
        }//: HStack
    }
}

// MARK: - Preview
struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .environmentObject(Shop())
            .environmentObject(Cart())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
