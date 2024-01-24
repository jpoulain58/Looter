//
//  LooterApp.swift
//  Looter
//
//  Created by Jeremy POULAIN on 1/19/24.
//

import SwiftUI

@main
struct LooterApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
              OnboardingView()
            } else {
              ContentView()
            }        }
    }
}
