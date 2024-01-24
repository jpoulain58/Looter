//
//  LootDetailView.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {

    var item: LootItem
    @State private var isAnimated = false
    @State private var isTriggered = false
    @State private var dropIcon = 0.0
    var body: some View {
        Section{
            AnimationsRow(item: item)
        }
        if item.rarity == Rarity.unique{
            Text("Item Unique 🏆")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(item.rarity.colorForRarity())
                .cornerRadius(10)
                .shadow(color: item.rarity.colorForRarity(), radius: isAnimated ? 50 : 0 )
                .animation(.bouncy .delay(1) ,value: isAnimated)
        }
        else {
            Text("")
                .frame(height: 50, alignment: .top)

        }
            List{
                DetailsItemRow(item: item)
                
                
                

                
        }
    }
}

#Preview {
    LootDetailView(item: testLootItems[0])
}


