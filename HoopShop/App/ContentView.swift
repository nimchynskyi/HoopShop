//
//  ContentView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

struct ContentView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    // MARK: - BODY
    var body: some View {
        VStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding()
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0) {
                            
                            FeaturedTabView()
                                .padding(.vertical, 20)
                                .frame(width: 380, height: 275, alignment: .center)
                            
                            // Categories grid
                            CategoryGridView()
                            
                            // Categories view
                            if shop.showShoes{
                                ShoesView()
                            }
                            else if shop.showBalls{
                                BallsView()
                            }
                            
                            // Brands
                            TitleView(title: "Brands")
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                        }//: VStack
                    })//: ScrollView
                }//: VStack
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }.preferredColorScheme(.light)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
            .environmentObject(Cart())
            .environmentObject(FirestoreManager())
    }
}
