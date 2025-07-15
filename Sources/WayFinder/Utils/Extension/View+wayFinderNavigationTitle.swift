//
//  View+wayFinderNavigationTitle.swift
//  WayFinder
//
//  Created by Starconnect on 7/15/25.
//

import SwiftUI

extension View {
    public func wayFinderNavigationTitle(_ title: String) -> some View {
        Group {
            if #available(iOS 16.0, *) {
                self.navigationTitle(title)
            } else {
                self.uipNavigationTitle(title)
            }
        }
    }
}
