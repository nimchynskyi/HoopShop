//
//  FeaturedItemView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI

struct FeaturedItemView: View {
    // MARK: - PROPERTY
    let featuredProduct: FeaturedProduct
    
    // MARK: - BODY
    var body: some View {
        Image(featuredProduct.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - PREVIEW
struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView(featuredProduct: featuredProducts[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
