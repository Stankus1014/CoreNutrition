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
}

public struct SubMeal: Codable, Sendable {
    public var name: String
    public var ingredients: [Ingredient]
    public var spices: [Spice]
}
