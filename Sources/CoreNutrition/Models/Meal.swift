//
//  Meal.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//
public struct Meal: Codable, Sendable {
    public var name: String
    public var ingredients: [Ingredient]
    public var spices: [Spice]
    public var subMeal: [SubMeal]
    
    public init(name: String, ingredients: [Ingredient], spices: [Spice], subMeal: [SubMeal]) {
        self.name = name
        self.ingredients = ingredients
        self.spices = spices
        self.subMeal = subMeal
    }
}

public struct SubMeal: Codable, Sendable {
    public var name: String
    public var ingredients: [Ingredient]
    public var spices: [Spice]
    
    public init(name: String, ingredients: [Ingredient], spices: [Spice]) {
        self.name = name
        self.ingredients = ingredients
        self.spices = spices
    }
}
