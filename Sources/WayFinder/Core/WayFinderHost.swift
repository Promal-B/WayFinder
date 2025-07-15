//
//  WayFinderHost.swift
//  WayFinder
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import UIPilot
import NavigationPilot

// MARK: - WayFinder Host
public struct WayFinderHost<T: Equatable & Hashable, Screen: View>: View {
    @ObservedObject private var pilot: WayFinder<T>
    private let routeMap: (T) -> Screen

    public init(_ pilot: WayFinder<T>, @ViewBuilder _ routeMap: @escaping (T) -> Screen) {
        self.pilot = pilot
        self.routeMap = routeMap
    }

    public var body: some View {
        if pilot.isUsingNavigationStack {
            if #available(iOS 16.0, *) {
                NavigationPilotHost(pilot.underlyingNavigationPilot!, routeMap)
                    .environmentObject(pilot)
            } else {
                UIPilotHost(pilot.underlyingUIPilot!, routeMap)
                    .environmentObject(pilot)
            }
        } else {
            UIPilotHost(pilot.underlyingUIPilot!, routeMap)
                .environmentObject(pilot)
        }
    }
}
