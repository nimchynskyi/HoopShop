//
//  CodableBundleExtension.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 15/08/2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable> (_ file: String) -> T {
        //1. Locate JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //2. Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4. Create property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //5. Return ready-to-use data
        return decodedData
    }
}
