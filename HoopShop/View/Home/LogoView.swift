//
//  LogoView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI

struct LogoView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 4) {
            Text("Hoop".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image(systemName: "sportscourt")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("Shop".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
        }
    }
}

// MARK: - PREVIEW
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}

