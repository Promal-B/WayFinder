//
//  CustomHomeView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

struct CustomHomeView: View {
    @EnvironmentObject var wayFinder: WayFinder<CustomRoute>

    var body: some View {
        VStack(spacing: 20) {
            Text("Custom Routes Example")
                .font(.title)
            
            Text("Using: \(wayFinder.isUsingNavigationStack ? "NavigationStack" : "UINavigationController")")
                .font(.caption)
                .foregroundColor(.secondary)

            Button("View User Profile") {
                wayFinder.push(.userProfile(userId: "12345"))
            }
            .buttonStyle(.borderedProminent)

            Button("View Product") {
                wayFinder.push(.productDetail(productId: 67890))
            }
            .buttonStyle(.borderedProminent)

            Button("Settings") {
                wayFinder.push(.settings)
            }
            .buttonStyle(.borderedProminent)
        }
        .wayFinderNavigationTitle("Home")
    }
}
