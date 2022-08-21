//
//  CartItemView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct CartItemView: View {
    @EnvironmentObject var cart: Cart
    var cartItem: CartProduct
    
    var body: some View {
        HStack {
            Image(cartItem.product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(cartItem.product.name)
                    .fontWeight(.semibold)
                
                Text("$\(cartItem.product.price)")
                
                Button("Show details"){}
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("x \(cartItem.count)")
        }
    }
}


struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(cartItem: sampleOrder)
    }
}
