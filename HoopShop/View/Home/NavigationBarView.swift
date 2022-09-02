//
//  NavigationBarView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var cart: Cart
    @State private var isAnimated: Bool = false
    @State private var showingDot = false
    
    // MARK: - BODY
    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.5)){
                        isAnimated.toggle()
                    }
                }
            
            Spacer()
            
            Button(action: {
                cart.showingCart.toggle()
                feedback.impactOccurred()
            }, label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                    if cart.showingDot {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 14, height: 14, alignment: .center)
                            .offset(x: 13, y: -10)
                    }
                }
            }).sheet(isPresented: $cart.showingCart) {
                CartView()
            }
        }
    }
}

// MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .environmentObject(Cart())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
