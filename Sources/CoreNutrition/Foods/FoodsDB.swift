//
//  FoodsDB.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//

public struct FoodsDB: Sendable {
    
    public static let shared: FoodsDB = FoodsDB(foods: FoodsCSVReader().read())
    
    public let foods: [Food]
    
    init(foods: [Food]) {
        self.foods = foods
    }
    
    public func getFood(by id: Int) -> Food? {
        if self.foods.count >= id {
            return self.foods[id - 1]
        }
        return nil
    }
    
    // TODO: Get foods by category
//    public func getFoods(by category: FoodCategory) -> [Eatable] {
//
//        switch category {
//            case .Meats:
//                return Array(Foods.shared.foods[0...79]).map { Eatable.food($0) }
//            case .Carbs:
//                return Array(Foods.shared.foods[80...145]).map { Eatable.food($0) }
//            case .Nuts:
//                return Array(Foods.shared.foods[146...156]).map { Eatable.food($0) }
//            case .Vegetables:
//                return Array(Foods.shared.foods[157...202]).map { Eatable.food($0) }
//            case .Fruits:
//                return Array(Foods.shared.foods[203...252]).map { Eatable.food($0) }
//            case .Dairy:
//                return Array(Foods.shared.foods[253...334]).map { Eatable.food($0) }
//            case .Oils:
//                return Array(Foods.shared.foods[335...343]).map { Eatable.food($0) }
//            case .Protein:
//                return Supplements.shared.proteins.map { Eatable.proteinPowder($0) }
//        }
//    }
    
}

public struct Food: Sendable {
    var id: Int
    var name: String
    var servingTypes: [ServingType]
    var cookedTypes: [CookedType]
    var macros: [CookedType : [ServingType : Macros]]
}
