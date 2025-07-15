//
//  ServiceHomeView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Service-Based Views
struct ServiceHomeView: View {
    @EnvironmentObject var navigationService: NavigationService

    var body: some View {
        VStack(spacing: 20) {
            Text("Service-Based Navigation")
                .font(.title)
            
            Text("Using: \(navigationService.mainWayFinder.isUsingNavigationStack ? "NavigationStack" : "UINavigationController")")
                .font(.caption)
                .foregroundColor(.secondary)

            if navigationService.isAuthenticated {
                Button("Go to Profile") {
                    navigationService.mainWayFinder.push(.profile)
                }
                .buttonStyle(.borderedProminent)

                Button("Logout") {
                    navigationService.logout()
                }
                .buttonStyle(.bordered)
            } else {
                Button("Login") {
                    navigationService.mainWayFinder.push(.login)
                }
                .buttonStyle(.borderedProminent)
            }

            Button("Settings") {
                navigationService.navigateToSettings()
            }
            .buttonStyle(.borderedProminent)
        }
        .wayFinderNavigationTitle("Home")
    }
}
