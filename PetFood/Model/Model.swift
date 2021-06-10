//
//  Model.swift
//  PetFood
//
//  Created by Sofi on 10.06.2021.
//

import Foundation
import SwiftUI

struct Model:Hashable {
    var id,  BrandName, FoodName, price, image, category:String
}
struct ModelCat:Hashable {
    var id,  BrandName, FoodName, price, image, category:String
}
