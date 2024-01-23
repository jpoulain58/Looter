//
//  ContentView.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/19/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot : [LootItem] = testLootItems
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(inventory.loot) { item in
                    
                        // Point de couleur en fonction de la rareté

                            NavigationLink {
                                    LootDetailView(item: item) // On passe directement l'item à la vue
                                } label: {
                                    LootRow(item: item)
                    }
                }
            }
            .sheet(isPresented: $showAddItemView) {
                AddItemView()
            }
            .navigationBarTitle("💼 Inventaire")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }.environmentObject(inventory)
    }



}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
