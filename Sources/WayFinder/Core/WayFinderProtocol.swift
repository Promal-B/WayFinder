//
//  WayFinderProtocol.swift
//  WayFinder
//
//  Created by Starconnect on 7/15/25.
//

import Foundation

// MARK: - Pilot Protocol
public protocol WayFinderProtocol: ObservableObject {
    associatedtype RouteType: Equatable
    var routes: [RouteType] { get }
    func push(_ route: RouteType)
    func pop(animated: Bool)
    func popTo(_ route: RouteType, inclusive: Bool, animated: Bool)
    func popToRoot(animated: Bool)
}
