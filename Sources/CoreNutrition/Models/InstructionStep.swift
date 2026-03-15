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
    
    public init(instructions: String, image_url: String? = nil) {
        self.instructions = instructions
        self.image_url = image_url
    }
}
