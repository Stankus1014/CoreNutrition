//
//  InstructionStep.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/14/26.
//
import Foundation

public struct InstructionStep: Codable, Hashable {
    public var instructions: String
    public var image_url: String?
}
