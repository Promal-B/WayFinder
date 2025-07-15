//
//  ServiceBasedNavigationExample.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Example: Navigation Service for Complex Apps
class NavigationService: ObservableObject {
    @Published var mainWayFinder = WayFinder<AppRoute>(initial: .home, debug: true, configuration: .automatic)
    @Published var isAuthenticated = false

    func login() {
        isAuthenticated = true
        mainWayFinder.popToRoot()
        mainWayFinder.push(.profile)
    }

    func logout() {
        isAuthenticated = false
        mainWayFinder.popToRoot()
    }

    func navigateToSettings() {
        // Navigate to settings from anywhere
        mainWayFinder.push(.settings)
    }
}

struct ServiceBasedNavigationExample: View {
    @StateObject private var navigationService = NavigationService()

    var body: some View {
        WayFinderHost(navigationService.mainWayFinder) { route in
            routeView(for: route)
        }
        .environmentObject(navigationService)
    }

    @ViewBuilder
    private func routeView(for route: AppRoute) -> some View {
        switch route {
        case .home:
            ServiceHomeView()
        case .profile:
            ServiceProfileView()
        case .settings:
            ServiceSettingsView()
        case .details:
            DetailsView()
        case .login:
            ServiceLoginView()
        case .register:
            RegisterView()
        }
    }
}

#Preview {
    ServiceBasedNavigationExample()
}
