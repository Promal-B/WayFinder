//
//  SettingsView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Settings View
struct SettingsView: View {
    @EnvironmentObject var wayFinder: WayFinder<AppRoute>
    @State private var hideNavBar = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.title)

            Toggle("Hide Navigation Bar", isOn: $hideNavBar)
                .padding()

            Button("Go to Profile") {
                wayFinder.push(.profile)
            }
            .buttonStyle(.borderedProminent)

            Button("Pop Back") {
                wayFinder.pop()
            }
            .buttonStyle(.bordered)

            Button("Pop to Root") {
                wayFinder.popToRoot()
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
        .wayFinderNavigationTitle("Settings")
        .wayFinderNavigationBarHidden(hideNavBar)
    }
}
