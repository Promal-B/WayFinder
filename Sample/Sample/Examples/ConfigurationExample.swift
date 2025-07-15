//
//  ConfigurationExample.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Example: Configuration-Specific Examples
struct ConfigurationExample: View {
    @StateObject private var autoWayFinder = WayFinder<AppRoute>(initial: .home, configuration: .automatic)
    @StateObject private var uiKitWayFinder = WayFinder<AppRoute>(initial: .home, configuration: .uiKit)
    @StateObject private var navigationStackWayFinder = WayFinder<AppRoute>(initial: .home, configuration: .navigationStack)
    
    @State private var selectedConfig = 0
    
    var body: some View {
        VStack {
            Picker("Configuration", selection: $selectedConfig) {
                Text("Automatic").tag(0)
                Text("UIKit").tag(1)
                Text("NavigationStack").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch selectedConfig {
            case 0:
                WayFinderHost(autoWayFinder) { route in
                    configRoutingView(for: route, wayFinder: autoWayFinder)
                }
            case 1:
                WayFinderHost(uiKitWayFinder) { route in
                    configRoutingView(for: route, wayFinder: uiKitWayFinder)
                }
            case 2:
                WayFinderHost(navigationStackWayFinder) { route in
                    configRoutingView(for: route, wayFinder: navigationStackWayFinder)
                }
            default:
                EmptyView()
            }
        }
    }
    
    @ViewBuilder
    private func configRoutingView(for route: AppRoute, wayFinder: WayFinder<AppRoute>) -> some View {
        switch route {
        case .home:
            VStack(spacing: 20) {
                Text("Configuration Test")
                    .font(.title)
                
                Text("Using: \(wayFinder.isUsingNavigationStack ? "NavigationStack" : "UINavigationController")")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Button("Go to Profile") {
                    wayFinder.push(.profile)
                }
                .buttonStyle(.borderedProminent)
            }
            .wayFinderNavigationTitle("Config Test")
        case .profile:
            VStack(spacing: 20) {
                Text("Profile")
                    .font(.title)
                
                Button("Back") {
                    wayFinder.pop()
                }
                .buttonStyle(.bordered)
            }
            .wayFinderNavigationTitle("Profile")
        default:
            Text("Route: \(route.rawValue)")
                .wayFinderNavigationTitle(route.rawValue)
        }
    }
}

#Preview {
    ConfigurationExample()
}
