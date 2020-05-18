//
//  fashionBrands.swift
//  NavigationExperiment3ProgrammaticContainerChild
//
//  Created by Albert Yu on 5/13/20.
//  Copyright © 2020 AlbertDemo. All rights reserved.
//

import Foundation


class Brand: Hashable {
    
    var name: String
    var styleName: String
    enum Style: CaseIterable{
        case sport
        case progressive
        case conservative
    }
        
    init (name: String) {
        self.name = name
        switch Style.allCases.randomElement()! {
        case .sport:
            self.styleName = "sport"
        case .progressive:
            self.styleName = "progressive"
        case .conservative:
            self.styleName = "conservative"
            }
        }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: Brand, rhs: Brand) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
