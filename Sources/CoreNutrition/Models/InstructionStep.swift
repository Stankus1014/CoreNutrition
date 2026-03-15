//
//  InstructionStep.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/14/26.
//
import Foundation

struct InstructionStep: Codable, Hashable {
    var instructions: String
    var image_url: String?
}
