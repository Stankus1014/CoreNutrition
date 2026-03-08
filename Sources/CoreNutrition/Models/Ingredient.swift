//
//  Ingredient.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//
import Foundation

public struct Ingredient: Codable, Sendable {
    
    public var id: Int
    public var amount: Double
    public var servingType: ServingType
    public var cookedType: CookedType
    public var spices: [Spice]
     
    public var proteinFlavor: ProteinPowderFlavors?
    public var foodFlavor: FoodFlavors?
    
}

public extension Ingredient {
    
    var foodType: FoodType {
        // TODO: Pre-determined list of ID's that are Protein Powders should return protein powder
        return .food
    }
    
}
