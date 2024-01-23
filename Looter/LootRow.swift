//
//  LootRow.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/23/24.
//

import SwiftUI

struct LootRow: View {
    let item: LootItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Circle()
                    .foregroundColor(item.rarity.colorForRarity())
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 8)
                Text(item.name).font(.headline)
                Spacer()
                Text(item.type.rawValue)
            }
            Text("Quantity: \(item.quantity)")                                }
    }
}

#Preview {
    LootRow(item: testLootItems[0])
}
