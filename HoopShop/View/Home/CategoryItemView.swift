//
//  CategoryItemView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 16/08/2022.
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTY
    let category: Category
    
    // MARK: - BODY
    var body: some View {
        Button(action: {}, label: {
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

// MARK: - PREVIEW
struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(category: categories[6])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}

