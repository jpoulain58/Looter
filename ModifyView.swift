import SwiftUI
    

struct ModifyView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var inventory: Inventory
    @State private var name = ""
    @State private var selectedGame = Game.emptyGame
    @State private var selectedType = ItemType.dagger
    @State private var selectedRarity = Rarity.common
    @State private var selectedQuantity = 1
    @State private var isAttack = true
    @State private var attackStrength = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rareté", selection: $selectedRarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(String(describing: rarity).capitalized)
                        }
                    }
                }

                Section {
                    
                        Picker("Jeu", selection: $selectedGame) {
                            Text(Game.emptyGame.name).tag(Game.emptyGame)
                            ForEach(availableGames) { game in
                                Text(game.name)
                                    .tag(game)
                            }
                        }
                    Stepper("Combien : \(selectedQuantity)",value: $selectedQuantity)
                }
                
                Section {
                    
                    Picker("Type", selection: $selectedType) {
                        ForEach(ItemType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }.pickerStyle(.palette)
                    HStack{
                        Text("Type :")
                        Spacer()
                        Text("\(selectedType.rawValue)")
                    }
                }
                
                Section {
                    
                    Toggle("Item d'attaque ? ", isOn: $isAttack)
                    if isAttack == true {
                        Stepper("Force d'attaque : \(attackStrength)", onIncrement: {
                            attackStrength += 1
                        }, onDecrement: {
                            attackStrength -= 1
                        })
                    }
                    
                }
                    Section {
                        
                        Button(action: {
                            let newItem = LootItem(quantity: selectedQuantity, name: name, type: selectedType ,rarity: selectedRarity, attackStrength: attackStrength, game: selectedGame)
                            inventory.addItem(item: newItem)
                            dismiss()
                        })
                        {
                            Text("Ajouter l'objet")
                        }
                    }
                
            }
            .navigationBarTitle("Ajouter un objet")
        }
    }
}



#Preview {
    ModifyView()
}
