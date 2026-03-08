//
//  FoodsCSVReader.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/8/26.
//

import Foundation

public actor FoodsCSVReader {
        
    public func read() async {
        await readFoodCSV()
    }

    private func readFoodCSV() async {
        
        func getServingTypes(rawString: String) -> [ServingType] {
            
            var types: [ServingType] = []
            
            let fields = rawString.split(separator: "/")
            
            for field in fields {
                let type = ServingType(rawValue: String(field)) ?? .None
                if type != .None { types.append(type) }
            }
            
            return types
            
        }
        
        let foodManager = FoodManager.shared
        
        guard let path = Bundle.main.path(forResource: "foods", ofType: "csv") else { return }
        
        do {
            let content = try String(contentsOfFile: path)
            var rows: [String] = content.components(separatedBy: "\n")
            rows.removeFirst()
            
            for row in rows {
                
                let columns = row.components(separatedBy: ",")
                guard let id : Int = Int(columns[0]) else { return }
                let name : String = columns[1]
                let servingTypes: [ServingType] = getServingTypes(rawString: columns[2])
                let cookedType : CookedType = CookedType(rawValue: columns[3]) ?? .none
                var macros : [ServingType : Macros] = .init()
                
                // Create New Object
                if await foodManager.exists(id: id) {
                    
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
                    await foodManager.addFood(foodObj)
                    
                }
                
                // Add Onto Existing Object
                else {
                    
                    let columns = row.components(separatedBy: ",")
                    guard let id : Int = Int(columns[0]) else { return }
                    let servingTypes: [ServingType] = getServingTypes(rawString: columns[2])
                    let cookedType : CookedType = CookedType(rawValue: columns[3]) ?? .none
                    var macros : [ServingType : Macros] = .init()
                    
                    await foodManager.addCookedType(id: id, type: cookedType)
                    
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
                    
                    await foodManager.addMacros(id: id, cookedType: cookedType, servingMacros: macros)
                }
            }
        }
        
        catch { print(error) }
        
    }
    
}
