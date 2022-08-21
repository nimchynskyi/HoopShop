//
//  CartPaymentView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct CartPaymentView: View {
    var body: some View {
        HStack {
            Image(systemName: "creditcard")
                .font(.title)
            
            Text("Order")
                .fontWeight(.semibold).font(.title)
            
        }.padding().foregroundColor(.white).background(Color.orange)
            .cornerRadius(40)
    }
}

struct CartPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CartPaymentView()
    }
}
