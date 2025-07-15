//
//  ProfileView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Profile View
struct ProfileView: View {
    @EnvironmentObject var wayFinder: WayFinder<AppRoute>

    var body: some View {
        VStack(spacing: 20) {
            Text("Profile Screen")
                .font(.title)

            Text("User: John Doe")
                .font(.headline)

            Button("View Details") {
                wayFinder.push(.details)
            }
            .buttonStyle(.borderedProminent)

            Button("Go to Settings") {
                wayFinder.push(.settings)
            }
            .buttonStyle(.borderedProminent)

            Button("Back to Home") {
                wayFinder.popTo(.home)
            }
            .buttonStyle(.bordered)
            
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
        .padding()
        .wayFinderNavigationTitle("Profile")
    }
}
