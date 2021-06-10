//
//  ViewModel.swift
//  PetFood
//
//  Created by Sofi on 10.06.2021.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON


class ViewModel: ObservableObject {
    @Published var model :[Model] = []
    @Published var modelCat :[ModelCat] = []
    init() {
        getDogs()
        getCat()
    }
    func getDogs()  {
        let url = "https://foodpets.madskill.ru/food?filter=dogs"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for i in 0..<json.count{
                    self.model.append(Model(id: json[i]["id"].stringValue, BrandName: json[i]["BrandName"].stringValue, FoodName: json[i]["FoodName"].stringValue, price: json[i]["price"].stringValue, image: json[i]["image"].stringValue, category: json[i]["category"].stringValue))
                }
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func getCat()  {
        let url = "https://foodpets.madskill.ru/food?filter=cats"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for i in 0..<json.count{
                    self.modelCat.append(ModelCat(id: json[i]["id"].stringValue, BrandName: json[i]["BrandName"].stringValue, FoodName: json[i]["FoodName"].stringValue, price: json[i]["price"].stringValue, image: json[i]["image"].stringValue, category: json[i]["category"].stringValue))
                }
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
