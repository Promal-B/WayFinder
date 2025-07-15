//
//  WayFinder.swift
//  WayFinder
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI
import Combine
import UIPilot
import NavigationPilot

// MARK: - Pilot Configuration
public enum WayFinderConfiguration {
    case uiKit
    case navigationStack
    case automatic
}

// MARK: - Wrapper class for NavigationPilot and UIPilot
public class WayFinder<T: Equatable & Hashable>: ObservableObject {
    @Published public private(set) var routes: [T] = []
    private let uiPilot: UIPilot<T>?
    private let navigationPilot: NavigationPilot<T>?
    private let configuration: WayFinderConfiguration
    private var cancellable: AnyCancellable?

    public init(initial: T? = nil, debug: Bool = false, configuration: WayFinderConfiguration = .automatic) {
        self.configuration = configuration

        let shouldUseNavigationStack: Bool
        switch configuration {
        case .uiKit:
            shouldUseNavigationStack = false
        case .navigationStack:
            shouldUseNavigationStack = true
        case .automatic:
            if #available(iOS 16.0, *) {
                shouldUseNavigationStack = true
            } else {
                shouldUseNavigationStack = false
            }
        }

        if shouldUseNavigationStack {
            self.navigationPilot = NavigationPilot<T>(initial: initial, debug: debug)
            self.uiPilot = nil
        } else {
            self.uiPilot = UIPilot<T>(initial: initial, debug: debug)
            self.navigationPilot = nil
        }

        setupRouteObservation()
    }

    private func setupRouteObservation() {
        if let navigationPilot = navigationPilot {
            cancellable = navigationPilot.$routes
                .receive(on: RunLoop.main)
                .assign(to: \.routes, on: self)
        } else if let uiPilot = uiPilot {
            self.routes = uiPilot.routes
        }
    }

    public func push(_ route: T) {
        if let navigationPilot = navigationPilot {
            navigationPilot.push(route)
        } else if let uiPilot = uiPilot {
            uiPilot.push(route)
            self.routes = uiPilot.routes
        }
    }

    public func pop(animated: Bool = true) {
        if let navigationPilot = navigationPilot {
            navigationPilot.pop(animated: animated)
        } else if let uiPilot = uiPilot {
            uiPilot.pop(animated: animated)
            self.routes = uiPilot.routes
        }
    }

    public func popTo(_ route: T, inclusive: Bool = false, animated: Bool = true) {
        if let navigationPilot = navigationPilot {
            navigationPilot.popTo(route, inclusive: inclusive, animated: animated)
        } else if let uiPilot = uiPilot {
            uiPilot.popTo(route, inclusive: inclusive, animated: animated)
            self.routes = uiPilot.routes
        }
    }

    public func popToRoot(animated: Bool = true) {
        if let navigationPilot = navigationPilot {
            navigationPilot.popToRoot(animated: animated)
        } else if let uiPilot = uiPilot {
            if let firstRoute = uiPilot.routes.first {
                uiPilot.popTo(firstRoute, inclusive: false, animated: animated)
                self.routes = uiPilot.routes
            }
        }
    }

    // Access to underlying pilots (internal scope)
    internal var underlyingUIPilot: UIPilot<T>? {
        uiPilot
    }

    internal var underlyingNavigationPilot: NavigationPilot<T>? {
        navigationPilot
    }

    public var isUsingNavigationStack: Bool {
        navigationPilot != nil
    }
}
