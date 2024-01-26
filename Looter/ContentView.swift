import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = testLootItems

    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @State private var selectedFeature: LooterFeature = .loot
    @StateObject var inventory = Inventory()
    @AppStorage("isOnboarding") var isOnboarding: Bool?

    func reset(){
        isOnboarding = true
    }
    var body: some View {
        Button(action: reset) {
            Text("Reset")
        }
        TabView(selection: $selectedFeature) {
            LootView(inventory: inventory)
                .tabItem {
                    Label("Loot", systemImage: "bag.fill")
                }
                .tag(LooterFeature.loot)

            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(LooterFeature.wishList)

            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeature.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum LooterFeature {
    case loot, wishList, profile
}
