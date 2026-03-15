//
//  FoodsCSVReader.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//

import Foundation

public struct FoodsCSVReader {
        
    func read() -> [Food] {
    
        print("READING")
        
        var foods: [Food] = []
        
        guard let path = Bundle.module.path(forResource: "foods", ofType: "csv") else {
            print("Error loading food path")
            return []
        }
        
        do {
            let content = try String(contentsOfFile: path)
            var rows: [String] = content.components(separatedBy: "\n")
            rows.removeFirst()
            
            for row in rows {
                
                let columns = row.components(separatedBy: ",")
                guard let id : Int = Int(columns[0]) else { return [] }
                let name : String = columns[1]
                let servingTypes: [ServingType] = getServingTypes(rawString: columns[2])
                let cookedType : CookedType = CookedType(rawValue: columns[3]) ?? .none
                var macros : [ServingType : Macros] = .init()
                
                if (foods.count < id) {
                    var foodObj = Food(
                        id: id,
                        name: name,
                        servingTypes: servingTypes,
                        cookedTypes: [cookedType],
                        macros: .init()
                    )
                    
                    // Get Macros
                    for (index,type) in servingTypes.enumerated() {
                        let offset =  4 + (index * 3)
                        let carbs : Double = Double(columns[offset]) ?? 0.0
                        let fat : Double = Double(columns[offset + 1]) ?? 0.0
                        let protein : Double = Double(columns[offset + 2]) ?? 0.0
                        
                        macros[type] = Macros(proteinPerServing: protein,
                                              carbsPerServing: carbs,
                                              fatPerServing: fat)
                    }
                    
                    foodObj.macros[cookedType] = macros
                    foods.append(foodObj)
                }
                else {
                    let columns = row.components(separatedBy: ",")
                    guard let id : Int = Int(columns[0]) else { return []}
                    let servingTypes: [ServingType] = getServingTypes(rawString: columns[2])
                    let cookedType : CookedType = CookedType(rawValue: columns[3]) ?? .none
                    var macros : [ServingType : Macros] = .init()
                    
                    foods[id - 1].cookedTypes.append(cookedType)
                    
                    // Get Macros
                    for (index,type) in servingTypes.enumerated() {
                        let offset =  4 + (index * 3)
                        let carbs : Double = Double(columns[offset]) ?? 0.0
                        let fat : Double = Double(columns[offset + 1]) ?? 0.0
                        let protein : Double = Double(columns[offset + 2]) ?? 0.0
                        
                        macros[type] = Macros(proteinPerServing: protein,
                                              carbsPerServing: carbs,
                                              fatPerServing: fat)
                    }
                    
                    foods[id - 1].macros[cookedType] = macros
                }
            }
            print("Read \(foods.count) foods")
            return foods
        }
        
        catch {
            print(error)
            return []
        }
        
        
    }
    
    private func getServingTypes(rawString: String) -> [ServingType] {
        
        var types: [ServingType] = []
        
        let fields = rawString.split(separator: "/")
        
        for field in fields {
            let type = ServingType(rawValue: String(field)) ?? .None
            if type != .None { types.append(type) }
        }
        
        return types
    }
    
}
