//
//  topMenuStruct.swift
//  SomeTest
//
//  Created by Rodomil on 12.10.2023.
//

import Foundation

struct TopMenuStruct {
    let name: String
    let image: String
    var selected: Bool = false
    
    mutating func reset() {
        selected = false
    }
}
