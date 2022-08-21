//
//  CartSummaryView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct CartSummaryView: View {
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        VStack {
            Button(action: {}) { Text("Add promo code").padding()}
            HStack {
                Text("Summary").bold()
                Spacer()
                VStack {
                    HStack {
                        Text("Count")
                        Spacer()
                        Text("\(cart.countTotal)")
                    }
                    HStack {
                        Text("Discount")
                        Spacer()
                        Text(String(format: "$%.2f", 0))
                    }
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(String(format: "$%.2f", cart.subtotal))
                    }
                }.frame(width: 200)
            }.padding()
        }
    }
}

struct CartSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CartSummaryView()
            .environmentObject(Cart())
    }
}
