//
//  CookedType.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//
import Foundation

public enum CookedType: String, Codable, Hashable, Sendable {
    case cooked = "cooked"
    case uncooked = "uncooked"
    case none = "none"
}
