//
//  LootDetailView.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    
    var body: some View {
        Section{
            VStack{
                Text(item.type.rawValue)
                    .padding()
                    .background(item.rarity.colorForRarity())
                    .cornerRadius(30)
                    .frame(height: 150, alignment: .bottom)
                    .font(.system(size: 80))
                    .shadow(color: item.rarity.colorForRarity(), radius: 100)

                Text(item.name).foregroundColor(item.rarity.colorForRarity())
                    .padding(10)
                    .frame(height: 150, alignment: .top)
                    .font(.system(size: 20))
                    .fontWeight(.black)


            }
        }
        if item.rarity == Rarity.unique{
            Text("Item Unique 🏆")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(item.rarity.colorForRarity())
                .cornerRadius(10)
        }
        else {
            Text("")
                .frame(height: 50, alignment: .top)

        }
            List{
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
}

#Preview {
    LootDetailView(item: testLootItems[0])
}
