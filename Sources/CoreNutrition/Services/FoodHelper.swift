//
//  FoodHelper.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/15/26.
//
public struct FoodHelper {
    
    public static func getImageURL(ingredientName: String) -> String {
        var name = ingredientName.lowercased()
        name = name.replacingOccurrences(of: "- ", with: "")
        name = name.replacingOccurrences(of: " ", with: "_")
        name = name.replacingOccurrences(of: "/", with: "_")
        name = name.replacingOccurrences(of: "%", with: "%25")
        return "https://s3.us-east-2.amazonaws.com/food.icons/Food_Icons/\(name).png"
    }
    
    public static func getIngredientName(id: Int) -> String {
        guard let food = FoodsDB.shared.getFood(by: id) else { return "" }
        return food.name
    }
    
}
