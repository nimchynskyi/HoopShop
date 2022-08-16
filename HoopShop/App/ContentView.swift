//
//  ContentView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView()
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
//            CategoryListView()
//                .padding(.vertical, 60)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0) {
                    FeaturedTabView()
                        .padding(.vertical, 20)
                        .frame(width: 380, height: 275, alignment: .center)
                    
                    CategoryGridView()
                    
                    TitleView(title: "Balls")
                    LazyVGrid(columns: gridLayout, spacing: 15,content: {
                        ForEach(products) { product in
                            ProductItemView(product: product)
                        }//: LOOP
                    })//: GRID
                    .padding(15)
                    
                    TitleView(title: "Brands")
                    BrandGridView()
                    
                    FooterView()
                        .padding(.horizontal)
                }//: VStack
            })//: ScrollView
        }//: VStack
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
