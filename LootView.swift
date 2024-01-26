import SwiftUI

struct LootView: View {
    @ObservedObject var inventory: Inventory
    @State var showAddItemView = false
    


    var body: some View {
        NavigationView {
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                    } label: {
                        LootRow(item: item)
                    }
                }.onDelete(perform: { indexSet in
                    inventory.loot.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showAddItemView) {
                AddItemView()
                    .environmentObject(inventory)
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
        }
    }
}

struct LootView_Previews: PreviewProvider {
    static var previews: some View {
        LootView(inventory: Inventory())
    }
}
