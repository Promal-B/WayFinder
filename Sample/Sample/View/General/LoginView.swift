//
//  LoginView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Login View
struct LoginView: View {
    @EnvironmentObject var wayFinder: WayFinder<AppRoute>
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.title)

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                // Simulate login success
                wayFinder.popToRoot()
                wayFinder.push(.profile)
            }
            .buttonStyle(.borderedProminent)

            Button("Don't have an account? Register") {
                wayFinder.push(.register)
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
        .wayFinderNavigationTitle("Login")
    }
}
