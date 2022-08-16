//
//  CategoryListView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import SwiftUI

struct CategoryListView: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel = CategoryModel()
    @ObservedObject var storageManager = StorageManager()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(viewModel.categories) { category in
                VStack(alignment: .leading) {
                    Text("\(category.id) id")
                        .font(.headline)
                    Text(category.name)
                        .font(.headline)
//                    Text(category.image)
//                        .font(.headline)
                }
            }
            .navigationTitle("Categories")
            .onAppear(){
                self.viewModel.fetchData()
            }
        }
    }
}

// MARK: - PREVIEW
struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
