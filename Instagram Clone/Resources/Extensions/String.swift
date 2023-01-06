//
//  String.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 6.01.2023.
//

import Foundation

extension String {
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
