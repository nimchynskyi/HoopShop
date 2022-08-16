//
//  CategoryGridView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 16/08/2022.
//

import SwiftUI

struct CategoryGridView: View {
    // MARK: - PROPERTY
    var gridLayout: [GridItem] {
        return Array (repeating: GridItem(), count: 2)
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout,
                      alignment: .center,
                      spacing: 10,
                      pinnedViews: [],
                      content: {
                Section(
                    header: SectionView(rotateClockwise: false),
                    footer: SectionView(rotateClockwise: true)
                ) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            })//: GRID
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        })//: SCROLL
    }
}

// MARK: - PREVIEW
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
