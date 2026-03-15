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
    
    public init(
        id: Int,
        amount: Double,
        servingType: ServingType,
        cookedType: CookedType,
        spices: [Spice],
        proteinFlavor: ProteinPowderFlavors? = nil,
        foodFlavor: FoodFlavors? = nil
    ) {
        self.id = id
        self.amount = amount
        self.servingType = servingType
        self.cookedType = cookedType
        self.spices = spices
        self.proteinFlavor = proteinFlavor
        self.foodFlavor = foodFlavor
    }
    
}


public extension Ingredient {
    
    var foodType: FoodType {
        // TODO: Pre-determined list of ID's that are Protein Powders should return protein powder
        return .food
    }
    
    var imageURL: String? {
        switch foodType {
        case .food:
            return FoodHelper.getImageURL(ingredientName: self.name)
        case .proteinPowder:
            return nil
        }
    }
    
    var name: String {
        switch foodType {
        case .food:
            return FoodHelper.getIngredientName(id: self.id)
        case .proteinPowder:
            return ""
        }
    }
    
    var servingTypes: [ServingType] {
        switch foodType {
        case .food:
            guard let food = FoodsDB.shared.getFood(by: self.id) else { return [] }
            return food.servingTypes
        case .proteinPowder:
            return []
        }
    }
    
    var cookedTypes: [CookedType] {
        switch foodType {
        case .food:
            guard let food = FoodsDB.shared.getFood(by: self.id) else { return [] }
            return food.cookedTypes
        case .proteinPowder:
            return []
        }
    }
    
    var amountTitle: String {
        return String(format: "%.1f", arguments: [self.amount])
    }
    
    /// Serving Title
    var servingTitle : String {
        if self.cookedType == .none {
            return String(format: "%@", arguments: [self.servingType.rawValue])
        } else {
            return String(format: "%@, %@", arguments: [self.servingType.rawValue, self.cookedType.rawValue])
        }
    }
    
}

public extension Ingredient {
    
    var macros: Macros? {
        guard let food = FoodsDB.shared.getFood(by: self.id),
              let macros = food.macros[self.cookedType]?[self.servingType]
        else {
            return nil
        }
        return macros
    }
    
    var proteinAmount: Double? {
        guard let macros = macros else { return nil }
        return macros.proteinPerServing * self.amount
        
    }
    
    var carbAmount: Double? {
        guard let macros = macros else { return nil }
        return macros.carbsPerServing * self.amount
    }
    
    var fatAmount: Double? {
        guard let macros = macros else { return nil }
        return macros.fatPerServing * self.amount
    }
    
    var totalCalories: Int? {
        guard let proteinAmount = proteinAmount,
              let carbAmount = carbAmount,
              let fatAmount = fatAmount
        else {
            return nil
        }
        
        return Int((proteinAmount * 4.0) + (carbAmount * 4.0) + (fatAmount * 9.0))
    }    
    
}


