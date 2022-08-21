//
//  RatingsSizesDetailView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 17/08/2022.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    @State var ballSizes: [String] = ["3", "4", "5", "6", "7"]
    @State var shoesSizes: [String] = ["42", "43", "44", "45", "46"]
    
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .top, spacing: 3, content: {
            //Ratings
            VStack(alignment: .leading, spacing: 3, content: {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 3, content: {
                    ForEach(1...5, id: \.self) { item in
                        Button(action: {}, label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundColor(.blue)
                        })
                    }
                })//: HStack
            })//: VStack
            
            Spacer()
            //Sizes
            VStack(alignment: .trailing, spacing: 3, content: {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 5, content: {
                    if shop.selectedProduct?.productType == "ball" {
                        ForEach(ballSizes, id: \.self) { size in
                            Button(action: {}, label: {
                                Text(size)
                                    .font(.footnote)
                                    .fontWeight(.heavy)
                                    .foregroundColor(colorGray)
                                    .frame(width: 28, height: 28, alignment: .center)
                                    .background(Color.white.cornerRadius(5))
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(colorGray, lineWidth: 2)
                                    )
                            })
                        }
                    } else {
                        ForEach(shoesSizes, id: \.self) { size in
                            Button(action: {}, label: {
                                Text(size)
                                    .font(.footnote)
                                    .fontWeight(.heavy)
                                    .foregroundColor(colorGray)
                                    .frame(width: 28, height: 28, alignment: .center)
                                    .background(Color.white.cornerRadius(5))
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(colorGray, lineWidth: 2)
                                    )
                            })
                        }
                    }
                })//: HStack
            })//: VStack
        })//: HStack
    }
}

// MARK: - PREVIEW
struct RatingsSizesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsSizesDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
