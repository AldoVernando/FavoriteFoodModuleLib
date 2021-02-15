//
//  NutrientModel.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

import Foundation

class NutrientModel {
    var energy: Double
    var protein: Double
    var fat: Double
    var carbs: Double
    var fiber: Double
    
    init(energy: Double, protein: Double, fat: Double, carbs: Double, fiber: Double) {
        self.energy = energy
        self.protein = protein
        self.fat = fat
        self.carbs = carbs
        self.fiber = fiber
    }
}
