//
//  CartItemDetail.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct CartItemDetail: View {
    var cartItem: CartProduct
    
    var body: some View {
        VStack {
            ScrollView{
                Text(cartItem.product.name).font(.largeTitle)
                
                Image(cartItem.product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                Text("$\(cartItem.product.price)")
                
                Text(cartItem.product.description)
                    .multilineTextAlignment(.center)
                    .padding(.all, 20.0)
                    .font(.system(size: 12))
            }
        }
    }
    
    struct CartItemDetail_Previews: PreviewProvider {
        static var previews: some View {
            CartItemDetail(cartItem: sampleOrder)
        }
    }
}
