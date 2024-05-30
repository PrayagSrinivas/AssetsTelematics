//
//  MenuTitle.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 30/05/24.
//

import Foundation

struct MenuTitle: Identifiable {
    let title: String
    let id: UUID = UUID()
    
    init(title: String) {
        self.title = title
    }
}
