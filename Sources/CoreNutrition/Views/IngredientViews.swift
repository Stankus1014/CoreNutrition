//
//  IngredientViews.swift
//  CoreNutrition
//
//  Created by William Stankus on 3/14/26.
//
import SwiftUI
import Kingfisher

public struct IngredientRow: View {
    
    private let ingredient: Ingredient
    private var onClick: () -> Void
    
    public init(
        ingredient: Ingredient,
        onClick: @escaping () -> Void
    ) {
        self.ingredient = ingredient
        self.onClick = onClick
    }
    
    public var body: some View {
        Button(action: onClick) {
            HStack {
                KFImage(URL(string: ingredient.imageURL ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                
                VStack(alignment: .leading) {
                    Text(ingredient.name)
                        .font(.title3)
                    HStack(spacing: 3) {
                        Text("\(ingredient.amountTitle)")
                            .bold()
                        Text("\(ingredient.servingTitle)")
                    }
                }
                
                Spacer()
                
                Text("\(ingredient.totalCalories ?? 0)")
                    .italic()
                    .multilineTextAlignment(.trailing)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(.plain)
    }
}

public struct IngredientEditableRow: View {
    
    private let ingredient: Ingredient
    private var onDelete: () -> Void
    
    public init(
        ingredient: Ingredient,
        onDelete: @escaping () -> Void
    ) {
        self.ingredient = ingredient
        self.onDelete = onDelete
    }
    
    public var body: some View {
        IngredientRow(
            ingredient: ingredient,
            onClick: { print("Clicked") }
        )
        .swipeActions {
            Button(role: .destructive) {
                onDelete()
            } label: {
                Image(systemName: "trash")
            }

        }
        
    }
}

#Preview {
    
    let ingredient = Ingredient(
        id: 1,
        amount: 12,
        servingType: .Ounce,
        cookedType: .cooked,
        spices: [
            Spice(spice: .cajunSeasoning)
        ])
    
    
    ZStack {
        VStack(spacing: 30) {
            IngredientRow(
                ingredient: ingredient,
                onClick: { print("Clicked") }
            )
                .padding()
                .background(Color.gray)
                .clipShape(
                    RoundedRectangle(cornerRadius: 14)
                )
                .shadow(color: Color.black, radius: 6.0, x: 0, y: 3)
            
            IngredientEditableRow(
                ingredient: ingredient,
                onDelete: { print("Delete")}
            )
                .padding()
                .background(Color.gray)
                .clipShape(
                    RoundedRectangle(cornerRadius: 14)
                )
                .shadow(color: Color.black, radius: 6.0, x: 0, y: 3)
            
        }
        .padding()
    }
        
}
