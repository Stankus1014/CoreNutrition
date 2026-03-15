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
    
}

public struct Food: Sendable {
    var id: Int
    var name: String
    var servingTypes: [ServingType]
    var cookedTypes: [CookedType]
    var macros: [CookedType : [ServingType : Macros]]
}
