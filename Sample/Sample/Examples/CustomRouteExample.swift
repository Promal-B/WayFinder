//
//  CustomRouteExample.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

enum CustomRoute: Equatable, Hashable {
    case home
    case userProfile(userId: String)
    case productDetail(productId: Int)
    case settings
}

// MARK: - Example 1: Custom Route with Associated Values
struct CustomRouteExample: View {
    @StateObject private var wayFinder = WayFinder<CustomRoute>(initial: .home, configuration: .automatic)

    var body: some View {
        WayFinderHost(wayFinder) { route in
            switch route {
            case .home:
                CustomHomeView()
            case .userProfile(let userId):
                VStack(spacing: 20) {
                    Text("User Profile: \(userId)")
                        .font(.title)
                    
                    Button("Back") {
                        wayFinder.pop()
                    }
                    .buttonStyle(.bordered)
                }
                .wayFinderNavigationTitle("User \(userId)")
            case .productDetail(let productId):
                VStack(spacing: 20) {
                    Text("Product Detail: \(productId)")
                        .font(.title)
                    
                    Button("Back") {
                        wayFinder.pop()
                    }
                    .buttonStyle(.bordered)
                }
                .wayFinderNavigationTitle("Product \(productId)")
            case .settings:
                VStack(spacing: 20) {
                    Text("Settings")
                        .font(.title)
                    
                    Button("Back") {
                        wayFinder.pop()
                    }
                    .buttonStyle(.bordered)
                }
                .wayFinderNavigationTitle("Settings")
            }
        }
    }
}

#Preview {
    CustomRouteExample()
}
