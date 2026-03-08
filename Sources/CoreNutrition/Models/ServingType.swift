//
//  ServingTypes.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//

public enum ServingType : String, Codable, Hashable, Sendable {
    
    case Serving = "Serving"
    case Slice = "Slice"
    case Link = "Link"
    case Patty = "Patty"
    case HotDog = "Hot Dog"
    case Brat = "Brat"
    case Sheet = "Sheet"
    case Piece = "Piece"
    case Ounce = "oz"
    case Gram = "g"
    case ExtraLarge = "Extra Large"
    case Large = "Large"
    case Regular = "Regular"
    case Medium = "Medium"
    case Small = "Small"
    case Thin = "Thin"
    case Biscuit = "Biscuit"
    case Muffin = "Muffin"
    case Bun = "Bun"
    case Roll = "Roll"
    case Tortilla = "Tortilla"
    case Cake = "Cake"
    case Tablespoon = "tbsp"
    case Teaspoon = "tsp"
    case FluidOunce = "fl. oz"
    case cup = "cup"
    case milliter = "mL"
    case Scoop = "Scoop"
    case Packet = "Packet"
    case None = "None"
    
    public var defaultAmount: Double {
        switch self {
            case .Ounce:
                return 10.0
            case .Gram:
                return 100.0
            default:
                return 1.0
        }
    }
    
}
