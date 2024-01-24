//
//  OnboardingPageView.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/24/24.
//

import SwiftUI

struct OnboardingPageView: View {
    var id: (UUID)
    var title: String
    var description: String
    var image: String

    @State private var appear = false

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .scaleEffect(appear ? 1 : 0.9)
                .opacity(appear ? 1 : 0)
                .animation(.easeOut(duration: 0.8).delay(0.3), value: appear)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .transition(.slide)
                .animation(.easeInOut(duration: 0.6), value: appear)
            
            Text(description)
                .font(.body)
                .padding()
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.6).delay(0.3), value: appear)
        }
        .onAppear {
            self.appear = true
        }
    }
}

// Preview
struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(id:(UUID),title: "Bienvenue", description: "Découvrez notre application", image: "bot")
    }
}

