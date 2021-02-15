//
//  FoodModel.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

public class FoodModel {
    public var id: String
    public var label: String
    public var nutrients: NutrientModel?
    public var category: String?
    public var categoryLabel: String?
    public var image: String
    
    public init(id: String, label: String?, nutrients: NutrientModel?, category: String?, categoryLabel: String? = "", image: String) {
        self.id = id
        self.label = label ?? ""
        self.nutrients = nutrients
        self.category = category
        self.categoryLabel = categoryLabel
        self.image = image
    }
}
