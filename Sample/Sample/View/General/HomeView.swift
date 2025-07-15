//
//  HomeView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Home View
struct HomeView: View {
    @EnvironmentObject var wayFinder: WayFinder<AppRoute>

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to WayFinder!")
                .font(.title)
                .padding()
            
            Text("Navigation Type: \(wayFinder.isUsingNavigationStack ? "NavigationStack" : "UINavigationController")")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom)

            Button("Go to Profile") {
                wayFinder.push(.profile)
            }
            .buttonStyle(.borderedProminent)

            Button("Go to Settings") {
                wayFinder.push(.settings)
            }
            .buttonStyle(.borderedProminent)

            Button("Go to Login") {
                wayFinder.push(.login)
            }
            .buttonStyle(.borderedProminent)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Current Route Stack:")
                    .font(.headline)
                ForEach(wayFinder.routes.indices, id: \.self) { index in
                    Text("\(index + 1). \(wayFinder.routes[index].rawValue)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
        .wayFinderNavigationTitle("Home")
    }
}
