//
//  DetailsView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Details View
struct DetailsView: View {
    @EnvironmentObject var wayFinder: WayFinder<AppRoute>

    var body: some View {
        VStack(spacing: 20) {
            Text("Details Screen")
                .font(.title)

            Text("This is a detailed view with more information.")
                .multilineTextAlignment(.center)
                .padding()

            Button("Go Deeper (Another Details)") {
                wayFinder.push(.details)
            }
            .buttonStyle(.borderedProminent)

            Button("Back to Profile") {
                wayFinder.popTo(.profile)
            }
            .buttonStyle(.bordered)

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
        .wayFinderNavigationTitle("Details")
    }
}
