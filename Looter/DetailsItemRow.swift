//
//  DetailsItemRow.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/23/24.
//

import SwiftUI

struct DetailsItemRow: View {
    var item: LootItem
    var body: some View {
        Section(header: Text("Informations")) {
            HStack{
                if let coverName = item.game.coverName, let image = UIImage(named: coverName) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                Text(item.game.name)
            }
            Text("In game : \(item.name)")
            Text("Puissance (ATQ) : \(item.attackStrength ?? 0)")
            Text("Possédé(s) : \(item.quantity)")
            Text("Rareté : \(String(describing: item.rarity))")
        }
    }
}

#Preview {
    DetailsItemRow(item: testLootItems[0])
}
