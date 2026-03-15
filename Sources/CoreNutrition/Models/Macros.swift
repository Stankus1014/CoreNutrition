//
//  Macros.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//
import Foundation

public struct Macros : Codable, Sendable {
    public var proteinPerServing: Double
    public var carbsPerServing: Double
    public var fatPerServing: Double
}
