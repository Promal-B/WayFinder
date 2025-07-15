//
//  RegisterView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

// MARK: - Register View
struct RegisterView: View {
    @EnvironmentObject var wayFinder: WayFinder<AppRoute>
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.title)

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Register") {
                // Simulate registration success
                wayFinder.popToRoot()
                wayFinder.push(.profile)
            }
            .buttonStyle(.borderedProminent)

            Button("Already have an account? Login") {
                wayFinder.pop() // Go back to login
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
        .wayFinderNavigationTitle("Register")
    }
}
