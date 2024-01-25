//
//  OnboardingView.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/24/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?

    func start(){
        isOnboarding = false
    }
    
    var body: some View {
        TabView {
            OnboardingPageView(id:UUID(), title: "Gérer ses jeux", description: "Organisez et gérez votre collection de jeux.", image: "bot")
            OnboardingPageView(id:UUID(),title: "Gérer ses loots", description: "Créez et personnalisez vos loots dans l'application.", image: "manage")
            OnboardingPageView(id:UUID(),title: "Ajouter ses loots", description: "Ajoutez et suivez vos loots et récompenses.", image: "loot")
        }
        .tabViewStyle(PageTabViewStyle())
        Button("Start", action: start)

    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
