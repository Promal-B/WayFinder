//
//  ServiceSettingsView.swift
//  Sample
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import WayFinder

struct ServiceSettingsView: View {
    @EnvironmentObject var navigationService: NavigationService

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings (Service-Based)")
                .font(.title)

            Button("Back to Home") {
                navigationService.mainWayFinder.popTo(.home)
            }
            .buttonStyle(.bordered)
        }
        .wayFinderNavigationTitle("Settings")
    }
}
