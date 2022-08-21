//
//  CategoryItemView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 16/08/2022.
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    // MARK: - BODY
    var body: some View {
        ForEach(firestoreManager.ctg_arr) { category in
            Button(action: {
                if category.name == "🏀 Balls" && !shop.showBalls && shop.showShoes{
                    shop.showBalls.toggle()
                    shop.showShoes = false
                }
                if category.name == "👟 Shoes" && !shop.showShoes && shop.showBalls{
                    shop.showShoes.toggle()
                    shop.showBalls = false
                }
            }, label: {
                HStack(alignment: .center, spacing: 50) {
                    Text(category.name.uppercased())
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }//: HSTACK
                .frame(minWidth: 140, maxWidth: 140)
                .padding()
                .background(Color.white.cornerRadius(12))
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
            })//: BUTTON
        }
    }
}

// MARK: - PREVIEW
struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView()
            .environmentObject(Shop())
            .environmentObject(FirestoreManager())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}

