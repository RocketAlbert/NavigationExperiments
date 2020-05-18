//
//  fashionBrandsModel.swift
//  NavigationExperiment3ProgrammaticContainerChild
//
//  Created by Albert Yu on 5/13/20.
//  Copyright © 2020 AlbertDemo. All rights reserved.
//
//

import Foundation


class BrandsModel: Hashable {

    static let sharedInstance = BrandsModel()
    
    var brandsArray: [Brand] = {
        var dior = Brand(name: "dior")
        var nike = Brand(name: "nike")
        var addidas = Brand(name: "addidas")
        var chanel = Brand(name:"chanel")
        return [dior, nike, addidas, chanel]
    }()
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: BrandsModel, rhs: BrandsModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
