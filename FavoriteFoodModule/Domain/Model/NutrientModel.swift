//
//  NutrientModel.swift
//  FavoriteFoodModule
//
//  Created by aldo vernando on 15/02/21.
//

import Foundation

public class NutrientModel {
    public var energy: Double
    public var protein: Double
    public var fat: Double
    public var carbs: Double
    public var fiber: Double
    
    public init(energy: Double, protein: Double, fat: Double, carbs: Double, fiber: Double) {
        self.energy = energy
        self.protein = protein
        self.fat = fat
        self.carbs = carbs
        self.fiber = fiber
    }
}
