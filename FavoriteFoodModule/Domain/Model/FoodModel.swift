//
//  FoodModel.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

class FoodModel {
    var id: String
    var label: String
    var nutrients: NutrientModel?
    var category: String?
    var categoryLabel: String?
    var image: String
    
    init(id: String, label: String?, nutrients: NutrientModel?, category: String?, categoryLabel: String? = "", image: String) {
        self.id = id
        self.label = label ?? ""
        self.nutrients = nutrients
        self.category = category
        self.categoryLabel = categoryLabel
        self.image = image
    }
}
