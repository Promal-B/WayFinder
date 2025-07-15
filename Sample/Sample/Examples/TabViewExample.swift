//
//  TabViewExample.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Example: Multiple WayFinders in TabView
struct TabViewExample: View {
    @StateObject private var mainWayFinder = WayFinder<AppRoute>(initial: .home, configuration: .automatic)
    @StateObject private var profileWayFinder = WayFinder<AppRoute>(initial: .profile, configuration: .automatic)

    var body: some View {
        TabView {
            WayFinderHost(mainWayFinder) { route in
                routeView(for: route)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            WayFinderHost(profileWayFinder) { route in
                routeView(for: route)
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
    }

    @ViewBuilder
    private func routeView(for route: AppRoute) -> some View {
        switch route {
        case .home:
            HomeView()
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        case .details:
            DetailsView()
        case .login:
            LoginView()
        case .register:
            RegisterView()
        }
    }
}

#Preview {
    TabViewExample()
}
