//
//  FoodManager.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//

public actor FoodManager {
    
    public static let shared = FoodManager()
    
    internal var foods : [Food] = []
        
    private init() {}
    
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
    
    internal func addFood(_ food: Food) {
        self.foods.append(food)
    }
    
    internal func addCookedType(id: Int, type: CookedType) {
        self.foods[id - 1].cookedTypes.append(type)
    }
    
    internal func exists(id: Int) -> Bool {
        return (self.foods.count >= id) ? true : false
    }
    
    internal func addMacros(id: Int, cookedType: CookedType, servingMacros: [ServingType : Macros]) {
        self.foods[id - 1].macros[cookedType] = servingMacros
    }
    
    
    
}

public struct Food {
    var id: Int
    var name: String
    var servingTypes: [ServingType]
    var cookedTypes: [CookedType]
    var macros: [CookedType : [ServingType : Macros]]
}
