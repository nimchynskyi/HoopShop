//
//  CartPaymentView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 21/08/2022.
//

import SwiftUI

struct CartPaymentView: View {
    @EnvironmentObject var cart: Cart
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            if cart.subtotal != 0.0 {
                cart.makeOrder()
                showingAlert = true
            }
        }, label: {
            HStack {
                Image(systemName: "creditcard")
                    .font(.title)
                
                Text("Order")
                    .fontWeight(.semibold).font(.title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(40)
        })
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Ordered successfully!"), message: Text("Thank you for your order!\nWe will contact you soon."), dismissButton: .default(Text("Okay!")))
        }
    }
}

struct CartPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        CartPaymentView()
            .environmentObject(Cart())
    }
}
