//
//  WayFinderSample.swift
//  WayFinderSample
//
//  Created by Developer on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Step 1: Define Your Routes
enum AppRoute: String, CaseIterable, Equatable, Hashable {
    case home = "Home"
    case profile = "Profile"
    case settings = "Settings"
    case details = "Details"
    case login = "Login"
    case register = "Register"
}

// MARK: - Main Content View
struct ContentView: View {
    // MARK: - Step 2: Create WayFinder with initial route
    @StateObject private var wayFinder = WayFinder<AppRoute>(initial: .home, debug: true)

    var body: some View {
        // MARK: - Step 3: Using WayFinderHost to map views with AppRoute
        WayFinderHost(wayFinder) { route in
            routeView(for: route)
        }
    }
    
    // MARK: - Step 4: Route mapping function
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
    ContentView()
}
